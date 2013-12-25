class UsersController < ApplicationController
  before_action :set_user, only: [:destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to newsfeed_path
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
