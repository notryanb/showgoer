class FollowingsController < ApplicationController

  def create
    follow = Following.create(follow_params)
    redirect_to user_path(follow.target_id)
  end

  def originators
   @user = User.find_by_id(params[:user_id])
   @usr_followers = Following.user_originators(@user)
 end

 def targets
  @user = User.find_by_id(params[:user_id])
  @usr_followings = Following.user_targetors(@user)
end

private
def follow_params
  params.permit(:target_id).merge(:originator => current_user)
end
end

