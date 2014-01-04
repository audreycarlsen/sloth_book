class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship.save
    redirect_to(:back)
  end

  def update
    @friendship = current_user.inverse_friendships.find(params[:id])
    @friendship.update(friendship_params)
    redirect_to newsfeed_path
  end

  def edit
    @friendship = current_user.inverse_friendships.find(params[:id])
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Friend removed.'
    redirect_to user_path(params[:id])
  end

  private
  
  def friendship_params
    params.require(:friendship).permit(:status)
  end
end