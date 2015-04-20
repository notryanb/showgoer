class ConcertsController < ApplicationController
  
  def artist
  end

  def show
    @s3_direct_post = S3_BUCKET.presigned_post(key: "#{SecureRandom.uuid}"+"${filename}", success_action_status: 201, acl: :public_read)

    @concert = Concert.find_by(id: params[:id])
    @concert_id = @concert.id
    @related_videos = @concert.videos

    if current_user == nil
      current_user = "no one"
    end 

    if @related_videos.count == 0
      @header_video = '../blipfest2012.mp4'
    else
      @header_video = @related_videos.sample.url
    end
  end

  def upload

  end

  def videoupload

  end

end