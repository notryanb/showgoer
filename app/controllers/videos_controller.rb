class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def new
     @s3_direct_post = S3_BUCKET.presigned_post(key: "#{SecureRandom.uuid}"+"${filename}", success_action_status: 201, acl: :public_read)
  end

  def create

    @video = Video.new(url: params[:url])

    if @video.save
      redirect_to '/videos'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end

  end

end