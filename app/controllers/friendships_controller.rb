class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      redirect_to root_url, notice: "Friend request sent."
    else
      flash[:notice] = 'Unable to add friend.'
      redirect_to root_url
    end
  end

  def update
    @friendship = current_user.inverse_friendships.find(params[:id])
    @friendship.status = 'accepted'
    @friendship.save
    redirect_to root_url
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = 'Friend removed.'
    redirect_to root_url
  end
end
