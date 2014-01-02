class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    @friendship.save
    redirect_to users_path, notice: "Friend request sent."
  end

  def update
    @friendship = current_user.inverse_friendships.find(params[:id])
    @friendship.status = 'accepted'
    @friendship.save
    redirect_to newsfeed_path
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Friend removed.'
    redirect_to user_path(params[:id])
  end
end
