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
                StudyRecord.create(user_id: @user.id, grade1:'00000000000000000000000000000000000000000000000000000000000000000000000000000000',grade2:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade3:'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade4:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade5:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade6:'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000')
                Lifecost.create(user_id: @user.id, twenty:3000000, thirty:4000000, forty:5000000, fifty:6000000, sixty:2000000, marriage:0, child:0, house:0, car:0, care:0, rent:0, utility:0, internet:0, insurance:0, car_cost:0, child_care:0, lesson:0, transport:0, pocket_money:0, other_cost:0, food:0, necessity:0, medical_cost:0, child_lesson:0, clothes:0, beauty:0, companionship:0, entertainment:0, small_cost:0, exception:0, marriage_total:5130000, child_total:12750000, house_total: 39450000, car_total:15000000, tax:20, pension:0 )
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