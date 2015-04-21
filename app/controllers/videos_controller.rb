require 'uri'

class VideosController < ApplicationController

  def index

  end

 #CREATION OF VIDEO AND ASSOCATION TO CONCERT / ARTIST
  def create
    @video = Video.new(url: params[:url], concert_id: params[:concert_id], user_id: params[:user_id])

    if @video.save

    http = params[:url].sub(/([https])\w+/,'http')
    http = URI::encode(http)

    thumbnail = "#{SecureRandom.uuid}thumbnail.jpg"
    base = Rails.root.to_path

    system("ffmpeg -i #{http} -ss 00:00:10 -vframes 1 -f image2 #{thumbnail}")
    system("aws s3 cp #{base}/#{thumbnail} s3://dbc.showgoer.videos")

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