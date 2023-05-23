class SocialMediaController < ApplicationController
    layout 'social_media'

    def index
        @posts = Post.all
    end
end
