class VideosController < ApplicationController

  def index

  end

 # NECESSARY FOR VIDEO UPLOAD
  def new
     @s3_direct_post = S3_BUCKET.presigned_post(key: "#{SecureRandom.uuid}"+"${filename}", success_action_status: 201, acl: :public_read)

     @test_concert_id = Concert.find_by_id(1501).id
  end

 #CREATION OF VIDEO AND ASSOCATION TO CONCERT / ARTIST
  def create
    @video = Video.new(url: params[:url], concert_id: params[:concert_id])

    if @video.save
      redirect_to "/concerts/#{@video.concert_id}"
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  def show

  end


end