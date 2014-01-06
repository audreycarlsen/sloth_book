class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship.save
    redirect_to(:back)
  end

  def update
    @friendship = current_user.inverse_friendships.find(params[:id])
    @friendship.status = 'accepted'
    @friendship.save
    redirect_to newsfeed_path
  end

  def destroy
    if current_user.friendships.find_by(id: params[:id])
      @friendship = current_user.friendships.find_by(id: params[:id])
    elsif current_user.inverse_friendships.find_by(id: params[:id])
      @friendship = current_user.inverse_friendships.find_by(id: params[:id])
    end
    @friendship.destroy
    redirect_to :back
  end

  private
  
  def friendship_params
    params.require(:friendship).permit(:status)
  end
end