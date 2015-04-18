class ConcertsController < ApplicationController
  
  def artist
  end

  def show
    @test_concert = Concert.find_by(id: params[:id])
    @test_concert_id = @test_concert.id
    @related_videos = @test_concert.videos
    @video_play_test = @related_videos.sample
  end

  def upload

  end

  def videoupload

  end

end