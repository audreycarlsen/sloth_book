class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to(:back)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :author_id, :content)
  end
end
