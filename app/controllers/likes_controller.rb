class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        like = current_user.likes.build(post_id: params[:post_id])
        @posts = Post.all
        @params_url = params[:url]
        respond_to do |format|
            if like.save
                if params[:url] == 'index'
                    format.html { redirect_to 'posts/index' }
                    format.js
                elsif params[:url] == 'show'
                    format.html { redirect_to 'posts/' + params[:post_id] }
                    format.js
                elsif params[:url] == 'posted'
                    @user = User.find(params[:user_id])
                    @post_cat = params[:post_cat]
                    if @post_cat == 'posted'
                        @posts = @user.posts
                    elsif @post_cat == 'liked'
                        @posts = @user.like_posts
                    elsif @post_cat == 'commented'
                        @posts = @user.comment_posts
                    end
                    format.html { redirect_to 'posted/' + params[:user_id]}
                    format.js
                end
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
        @params_url = params[:url]
        respond_to do |format|
            if like.destroy
                if params[:url] == 'index'
                    format.html { redirect_to 'posts/index' }
                    format.js
                elsif params[:url] == 'show'
                    format.html { redirect_to 'posts/' + params[:post_id] }
                    format.js
                elsif params[:url] == 'posted'
                    @user = User.find(params[:user_id])
                    @post_cat = params[:post_cat]
                    if @post_cat == 'posted'
                        @posts = @user.posts
                    elsif @post_cat == 'liked'
                        @posts = @user.like_posts
                    elsif @post_cat == 'commented'
                        @posts = @user.comment_posts
                    end
                    format.html { redirect_to 'posted/' + params[:user_id]}
                    format.js
                end
            else
                flash[:error] = like.errors.full_messages.join(', ')
                format.html { redirect_to @post, alert: "Failed to unlike post." }
            end
        end
    end
end


