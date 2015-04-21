class FollowingsController < ApplicationController

  def create
    p params
    follow = Following.create(follow_params)
    p follow
    redirect_to user_path(follow.target_id)
  end

  private
  def follow_params
    params.permit(:target_id).merge(:originator => current_user)
  end
end

