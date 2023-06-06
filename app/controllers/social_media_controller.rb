class SocialMediaController < ApplicationController
    layout 'social_media'

    def index
        @posts = Post.all
    end

    def posted
        @user = User.find(params[:id])
        @posts = current_user.posts
        @like_posts = current_user.like_posts
        @comment_posts = current_user.comment_posts
    end

    def followers
        @relationships = Relationship.where(followed_id: current_user.id)
    end

    def followed
        @relationships = Relationship.where(follower_id: current_user.id)
    end
end
