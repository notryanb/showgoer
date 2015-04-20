class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: params[:user_id], video_id: params[:video_id])

    video = Video.find_by(id: params[:video_id])
    like_count = video.likes.count
    p "Like Count: #{like_count}"
    if request.xhr?
      render json:like_count, layout: false
    else
      redirect_to :back
    end
  end


end