class SessionsController < ApplicationController

    def new
        
    end

    def create
        #guest_loginの場合
        if params[:session][:guest] == 'true'
            id = User.maximum(:id).to_s
            @name = 'Guest User ' + id
            @username = '@guest_user' +  id
            @email = 'user' + id + '@example.com'
            @user = User.new(name: @name, username: @username, email: @email, password: 'aaaaaaaa', password_confirmation: 'aaaaaaaa', zip: '0000000', prefecture: '東京都', city: '〇〇区', street: '〇〇町', tel: '0000000000', profile: 'ゲストでお試しログインしています。ログアウトするとアカウントが破棄されます。', activated: true)
            if @user.save
                Cart.create(user_id: @user.id)
                StudyRecord.create(user_id: @user.id)
                Lifecost.create(user_id: @user.id)
                p "ゲストログインアカウントを作成し、ログインしました。"
                @user.update(address: @user.prefecture + @user.city + @user.street)
                user = @user
            else
                p "ゲストログインアカウントの作成に失敗しました"
            end
        else
            # 通常ログインの場合
            user = User.find_by(email: params[:session][:email].downcase)
        end

        if user && user.authenticate(params[:session][:password])
            if user.activated?
                log_in(user)
                params[:session][:remember_me] == "1" ? remember(user) : forget(user)
                if Cart.find_by(id: session[:cart_id]).present?
                    cart_works = CartWork.where(cart_id: session[:cart_id])
                    cart_works.each do |cw|
                        CartWork.create(cart_id: user.cart.id, work_id: cw.work_id )
                    end
                end
                if user.email.include? "@example.com"
                    flash[:success] = "ゲストログインに成功しました"
                else
                    flash[:success] = user.email + " でのログインに成功しました"
                end
                redirect_to root_url
            else
                flash[:warning] = "アカウントが有効化されていません。届いたメールをご確認の上、アカウントを有効化してください。"
                redirect_to root_url
            end
        else
            flash.now[:alert] = "メールアドレスまたはパスワードが正しくありません。"
            render "new", status: :unprocessable_entity
        end
    end


    def destroy
        # ログイン中のみログアウトする
        if logged_in?
            cart = Cart.find_by(id: session[:cart_id])
            if cart.present?
                cart.destroy
            end

            log_out
        end
        redirect_to root_path, status: :see_other
    end
end