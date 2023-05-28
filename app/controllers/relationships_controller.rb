class RelationshipsController < ApplicationController
    def create
        relationship = Relationship.new(relationship_params)
        if relationship.save
          flash[:success] = "フォローしました！"
        else
          flash[:error] = relationship.errors.full_messages.join(', ')
        end
        redirect_to "/posts"
    end

    def destroy
        relationship = Relationship.find_by(params[:id])
        relationship.destroy
        flash[:success] = "フォローを解除しました！"
        redirect_to "/posts"
    end
    
    private
    def relationship_params
        params.require(:relationship).permit(:follower_id, :followed_id)
    end
end
