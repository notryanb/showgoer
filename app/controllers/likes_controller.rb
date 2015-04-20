class LikesController < ApplicationController



  def create
    p "PARAMS #{params}------------------"

    @like = Like.create(user_id: params[:user_id], video_id: params[:video_id])

    redirect_to :back
  end


end