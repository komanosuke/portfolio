class CommentsController < ApplicationController
    layout 'social_media'

    def create
        comment = current_user.comments.build(post_id: params[:post_id])
        comment.save
        redirect_to posts_path
    end

    def destroy
        comment = Comment.find_by(post_id: params[:post_id], user_id: current_user.id)
        comment.destroy
        redirect_to posts_path
    end
end