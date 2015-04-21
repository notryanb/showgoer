class FollowingsController < ApplicationController

  def create
    follow = Following.create(follow_params)
    redirect_to user_path(follow.target_id)
  end

  def originators
    @user_originatorids = []
    @user_originators = []
    @user = User.find_by_id(params[:user_id])
    @theoriginators = Following.where(target_id: @user.id)
    @theoriginators.each do |target_object|
      @user_originatorids << target_object.originator_id
    end
    @user_originatorids.each do |originatorid|
      @user_originators << User.find_by_id(originatorid)
    end
    return @user_originators
  end

  def targets
    @user_targetids = []
    @user_targets = []
    @user = User.find_by_id(params[:user_id])
    @thetargets = Following.where(originator_id: @user.id)
    @thetargets.each do |target_object|
      @user_targetids << target_object.target_id
    end
    @user_targetids.each do |targetid|
      @user_targets << User.find_by_id(targetid)
    end
    return @user_targets
  end

  private
  def follow_params
    params.permit(:target_id).merge(:originator => current_user)
  end
end

