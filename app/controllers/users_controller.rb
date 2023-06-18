class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    before_action :logged_in_user, except: [:new, :confirm, :back, :success]
    before_action :guest_login_check, only: %i[ edit update destroy ]
    # GET /users or /users.json
    def index
        @users = User.all
    end

    # GET /users/1 or /users/1.json
    def show
        @posts = current_user.posts
        @like_posts = current_user.like_posts
        @comment_posts = current_user.comment_posts
    end

    # GET /users/new
    def new
        @user = User.new
    end

    # GET /users/1/edit
    def edit
        
    end

    # POST /users or /users.json
    def create
        @user = User.new(user_params)

        respond_to do |format|
            if @user.save
                Cart.create(user_id: @user.id)
                StudyRecord.create(user_id: @user.id, grade1:'00000000000000000000000000000000000000000000000000000000000000000000000000000000',grade2:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade3:'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade4:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade5:'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',grade6:'00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000')
                Lifecost.create(user_id: @user.id, twenty:3000000, thirty:4000000, forty:5000000, fifty:6000000, sixty:2000000, marriage:0, child:0, house:0, car:0, care:0, rent:0, utility:0, internet:0, insurance:0, car_cost:0, child_care:0, lesson:0, transport:0, pocket_money:0, other_cost:0, food:0, necessity:0, medical_cost:0, child_lesson:0, clothes:0, beauty:0, companionship:0, entertainment:0, small_cost:0, exception:0, marriage_total:5130000, child_total:12750000, house_total: 39450000, car_total:15000000, tax:20, pension:0 )
                UserMailer.account_activation(@user).deliver_now
                flash[:notice] = "アカウント仮登録が完了しました！以下の手続きに従って下さい。"
                @user.update(address: @user.prefecture + @user.city + @user.street)
                format.html { render :success, notice: "User was successfully created." }
            else
                flash.now[:alert] = "作成に失敗しました"
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /users/1 or /users/1.json
    def update
        if @user.update(user_params)
            @user.update(address: @user.prefecture + @user.city + @user.street)
            flash[:notice] = "アカウントが更新されました！"
            redirect_to "/users/" + params[:id] + "/edit"
        else
            flash.now[:alert] = "作成に失敗しました"
        end
    end

    # DELETE /users/1 or /users/1.json
    def destroy
        @user.destroy

        respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully destroyed." }
        format.json { head :no_content }
        end
    end

    def confirm
        if logged_in?
            render :login
        else
            @user = User.new(user_params)
            if @user.invalid?
                render :new
            end
        end
    end

    def back
        if logged_in?
            render :login
        else
            @user = User.new(user_params)
            render :new
        end
    end

    def success
        if logged_in?
            render :login
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
            @user = User.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def user_params
            params.require(:user).permit(:name, :username, :email, :password, :zip, :prefecture, :city, :street, :address, :tel, :image, :profile, :introduction)
        end

        def login_check
            if logged_in?
                render :login
            end
        end

        def guest_login_check
            if current_user.email == 'user@example.com'
                flash[:notice] = "ゲストログインのユーザーデータの操作はできません。"
                redirect_to "/users/" + current_user.id.to_s
            end
        end
end
