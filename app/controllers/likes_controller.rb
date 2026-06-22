class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    post.likes.find_or_create_by(user: current_user)

    redirect_back(fallback_location: posts_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    like = post.likes.find_by(user: current_user)
    like&.destroy

    redirect_back(fallback_location: posts_path)
  end
end