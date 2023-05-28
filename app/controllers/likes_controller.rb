class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        like = current_user.likes.build(post_id: params[:post_id])
        @posts = Post.all
        respond_to do |format|
            if like.save
                format.html { redirect_to 'posts/index' }
                format.js
            else
                flash[:error] = like.errors.full_messages.join(', ')
                format.html { redirect_to posts_path }
            end
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
        @posts = Post.all
        respond_to do |format|
            if like.destroy
                format.html { redirect_to 'posts/index' }
                format.js
            else
                format.html { redirect_to @post, alert: "Failed to unlike post." }
            end
        end
    end
end


