class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users =
      if params[:query].present?
        @users = User.where("user_name ILIKE ?", "%#{params[:query]}%")
      else
        User.none
      end
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end
end