class VideosController < ApplicationController

  def index

  end

 #CREATION OF VIDEO AND ASSOCATION TO CONCERT / ARTIST
  def create
    @video = Video.new(url: params[:url], concert_id: params[:concert_id], user_id: params[:user_id])

    if @video.save
      if request.xhr?
        render json:@video.url, layout: false
      else
        redirect_to "/concerts/#{@video.concert_id}"
      end
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
  end

end