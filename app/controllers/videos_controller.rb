class VideosController < ApplicationController

  def index
    @concert = Concert.find_by_id(1501) 
    @video_play_test = @concert.videos.last
    @related_videos = @concert.videos

  end

  def new
     @s3_direct_post = S3_BUCKET.presigned_post(key: "#{SecureRandom.uuid}"+"${filename}", success_action_status: 201, acl: :public_read)

     @test_concert_id = Concert.find_by_id(1501).id
  end

  def create
    @video = Video.new(url: params[:url], concert_id: params[:concert_id])

    if @video.save
      redirect_to '/videos'
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def show
    @video_play_test = Video.last
  end


end