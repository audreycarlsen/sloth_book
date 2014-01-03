class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.save
    # FIX REDIRECT
    redirect_to user_path(16)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :author, :content)
  end
end
