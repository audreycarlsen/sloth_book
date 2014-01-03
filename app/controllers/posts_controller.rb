class PostsController < ApplicationController
  def create
    # @user = User.find(params[:id])
    @post = Post.new(post_params)
    @post.save
    redirect_to user_path(16)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :author, :content)
  end
end
