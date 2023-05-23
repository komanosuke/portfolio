class SessionsController < ApplicationController

    def new
        
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            if user.activated?
                log_in(user)
                params[:session][:remember_me] == "1" ? remember(user) : forget(user)
                if user.email == "user@example.com"
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
        log_out if logged_in?
        redirect_to root_path, status: :see_other
    end
end
