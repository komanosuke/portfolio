class SocialMediaController < ApplicationController
    layout 'social_media'

    def index
        @posts = Post.all
    end

    def posted
        @user = User.find(params[:id])
        if request.post? and params[:post_cat]
            @post_params = params[:post_cat]
            if params[:post_cat] == 'posted'
                @posts = @user.posts.page(params[:page]).per(3)
            elsif params[:post_cat] == 'liked'
                @posts = @user.like_posts.page(params[:page]).per(3)
            elsif params[:post_cat] == 'commented'
                @posts = @user.comment_posts.page(params[:page]).per(3)
            end
            respond_to do |format|
                format.html
                format.js
            end
        else
            @posts = @user.posts.page(params[:page]).per(3)
        end
    end

    def followers
        @relationships = Relationship.where(followed_id: current_user.id).order(created_at: :desc)
    end

    def followed
        @relationships = Relationship.where(follower_id: current_user.id).order(created_at: :desc)
    end
end
