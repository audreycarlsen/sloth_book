class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      session[:user_id] = @user.id
      redirect_to newsfeed_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)

      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  def show
    @post = Post.new
  end

  def newsfeed
    @post = Post.new
  end

  def search
    thing_were_searching_for = params[:search]
    @users = User.search(thing_were_searching_for)
    if @users.empty?  
      redirect_to users_path, notice: "Sorry, Sloth Cadet, no items matching #{thing_were_searching_for}."      
    else
      render :index
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :photo_url, :password, :password_confirmation, :sex, :birth_month, :birth_day, :birth_year)
  end
end
