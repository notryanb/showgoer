class DislikesController < ApplicationController

  def create
    p "PARAMS #{params}------------------"

    @dislike = Dislike.create(user_id: params[:user_id], video_id: params[:video_id])

    redirect_to :back
  end

end