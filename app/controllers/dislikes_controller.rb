class DislikesController < ApplicationController

  def create
    p "HITTING THE DISLIKE POST ROUTE"
    @dislike = Dislike.create(user_id: params[:user_id], video_id: params[:video_id])

    video = Video.find_by(id: params[:video_id])

    dislike_count = video.dislikes.count
    p "Dislike Count: #{dislike_count}"
    if request.xhr?
      render json:dislike_count, layout: false
    else
      redirect_to :back
    end
  end

end