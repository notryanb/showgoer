class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def new
     @s3_direct_post = S3_BUCKET.presigned_post(key: "#{SecureRandom.uuid}"+"${filename}", success_action_status: 201, acl: :public_read)

     p "PRESEIGNED POST URL:        #{@s3_direct_post.url}"
  end

  def create


    p "I GOT TO THE CREATE ROUTE VIA AJAX #{params[:url]}"
    @video = Video.new(url: params[:url])

    if @video.save
      redirect_to videos_path, success: 'File successfully uploaded'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end

  end

end