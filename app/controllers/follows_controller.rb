class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:user_id])

    Follow.find_or_create_by!(
      follower: current_user,
      followed: user
    ) do |follow|
      follow.status = :accepted
    end

    redirect_to user_path(user)
  end

  def accept
    follow = current_user.received_follows.find(params[:id])
    follow.accepted!

    redirect_back fallback_location: root_path
  end

  def reject
    follow = current_user.received_follows.find(params[:id])
    follow.rejected!

    redirect_back fallback_location: root_path
  end

  def destroy
    follow = Follow.find(params[:id])
    follow.destroy

    redirect_back fallback_location: root_path
  end
end