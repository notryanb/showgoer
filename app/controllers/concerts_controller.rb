class ConcertsController < ApplicationController
  
  def artist
  end

  def show
    @comment = Comment.new
    
    @s3_direct_post = S3_BUCKET.presigned_post(key: "#{SecureRandom.uuid}"+"${filename}", success_action_status: 201, acl: :public_read)

    @concert = Concert.find_by(id: params[:id])
    @concert_id = @concert.id
    @related_videos = @concert.videos

    if current_user == nil
      current_user = "no one"
    end 

    if @related_videos.count == 0
      @header_video = "https://s3.amazonaws.com/dbc.showgoer.videos/BlipFest+2012+-+Omodaka.mp4"
    else
      @header_video = @related_videos.sample.url
    end
  end

  def upload

  end

  def videoupload

  end

end