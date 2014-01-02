class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @user = User.find(params[:id])
    redirect_to user_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:to, :from, :content)
  end
end
