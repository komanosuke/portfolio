class RelationshipsController < ApplicationController
    def create
        relationship = Relationship.new(relationship_params.except(:url))
        if relationship.save
          # flash[:success] = "フォローしました！"
          if relationship_params[:url]
            @params_url = relationship_params[:url]
            respond_to do |format|
              if relationship_params[:url].include?('followed')
                @relationships = Relationship.where(follower_id: current_user.id).order(created_at: :desc)
                format.html { redirect_to relationship_params[:url] }
                format.js
              elsif relationship_params[:url].include?('follower')
                @relationships = Relationship.where(followed_id: current_user.id).order(created_at: :desc)
                format.html { redirect_to relationship_params[:url] }
                format.js
              elsif relationship_params[:url] == '/posts'
                @posts = Post.all
                format.html { redirect_to relationship_params[:url] }
                format.js
              elsif relationship_params[:url].include?('posts')
                id = relationship_params[:url].split("/").last.to_i
                @post = Post.find(id)
                format.html { redirect_to relationship_params[:url] }
                format.js
              elsif relationship_params[:url].include?('posted')
                url = relationship_params[:url].split('/')[0..-2].join('/')
                id = url.split('/')[2].to_i
                @post_cat = relationship_params[:url].split('/').last
                @user = User.find(id)
                if @post_cat == 'posted'
                  @posts = @user.posts
                elsif @post_cat == 'liked'
                  @posts = @user.like_posts
                elsif @post_cat == 'commented'
                  @posts = @user.comment_posts
                end
                format.html { redirect_to url }
                format.js
              end
            end
          end
        else
          flash[:error] = relationship.errors.full_messages.join(', ')
        end
    end

    def destroy
        relationship = Relationship.find(params[:id])
        relationship.destroy
        # flash[:success] = "フォローを解除しました！"
        if params[:url]
          @params_url = params[:url]
          respond_to do |format|
            if params[:url].include?('followed')
              @relationships = Relationship.where(follower_id: current_user.id).order(created_at: :desc)
              format.html { redirect_to params[:url] }
              format.js
            elsif params[:url].include?('follower')
              @relationships = Relationship.where(followed_id: current_user.id).order(created_at: :desc)
              format.html { redirect_to params[:url] }
              format.js
            elsif params[:url] == '/posts'
              @posts = Post.all
              format.html { redirect_to params[:url] }
              format.js
            elsif params[:url].include?('posts')
              id = params[:url].split("/").last.to_i
              @post = Post.find(id)
              format.html { redirect_to params[:url] }
              format.js
            elsif params[:url].include?('posted')
              url = params[:url].split('/')[0..-2].join('/')
              id = url.split('/')[2].to_i
              @post_cat = params[:url].split('/').last
              @user = User.find(id)
              if @post_cat == 'posted'
                @posts = @user.posts
              elsif @post_cat == 'liked'
                @posts = @user.like_posts
              elsif @post_cat == 'commented'
                @posts = @user.comment_posts
              end
              format.html { redirect_to url }
              format.js
            end
          end
        end
    end
    
    private
    def relationship_params
        params.require(:relationship).permit(:follower_id, :followed_id, :url)
    end
end
