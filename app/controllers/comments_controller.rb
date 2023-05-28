class CommentsController < ApplicationController
    layout 'social_media'

    def create
        comment = current_user.comments.build(post_id: params[:post_id], content: params[:content])
        if comment.save
            redirect_to '/posts/' + params[:post_id]
            # format.html { redirect_to 'posts/index' }
            # format.js
        else
            # format.html { redirect_to @post, alert: "Failed to like post." }
            flash[:error] = comment.errors.full_messages.join(', ')
            redirect_to '/posts/' + params[:post_id]
        end
        # redirect_to posts_path
    end

    def destroy
        comment = Comment.find_by(post_id: params[:post_id], user_id: current_user.id)
        comment.destroy
        # redirect_to posts_path
    end
end