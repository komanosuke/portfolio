class PostsController < ApplicationController
    before_action :logged_in_user, except: [:index]
    layout 'social_media'

    # GET /posts or /posts.json
    def index
        @posts = Post.all.page(params[:page]).per(3)
    end

    # GET /posts/1 or /posts/1.json
    def show
        @post = Post.find(params[:id])
    end

    # GET /posts/new
    def new
        @post = Post.new
    end

    # GET /post/1/edit
    def edit
        
    end

    # POST /posts or /posts.json
    def create
        @post = current_user.posts.build(post_params)
        # @post = Post.new(post_params)

        if @post.save
            redirect_to '/posts'
            flash[:notice] = "新しい投稿が作成されました！"
        else
            flash.now[:alert] = "作成に失敗しました"
        end
    end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
        if @post.update(post_params)
            redirect_to "/posts/" + params[:id] + "/edit"
            flash[:notice] = "投稿が更新されました！"
        else
            flash.now[:alert] = "作成に失敗しました"
        end
    end

    # DELETE /posts/1 or /posts/1.json
    def destroy
        @post.destroy

        respond_to do |format|
        format.html { redirect_to posts_url, notice: "投稿が削除されました！" }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_post
            @post = Post.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def post_params
            params.require(:post).permit(:user_id, :content, :image)
        end
end
