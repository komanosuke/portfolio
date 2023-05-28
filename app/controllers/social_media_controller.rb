class SocialMediaController < ApplicationController
    layout 'social_media'

    def index
        @posts = Post.all
    end

    def followers
        @relationships = Relationship.where(followed_id: current_user.id)
    end

    def followed
        @relationships = Relationship.where(follower_id: current_user.id)
    end
end
