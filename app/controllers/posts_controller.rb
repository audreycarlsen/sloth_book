class PostsController < ApplicationController
  def create
    @user = User.find(params[:id])
    @post = Post.new(post_params)
    @post.save
    render user_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :author, :content)
  end
end
