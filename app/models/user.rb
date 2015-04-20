class User < ActiveRecord::Base
  has_secure_password
  has_many :likes
  has_many :dislikes
  has_many :videos

  def self.user_videos(userid)
    @user_videos = Video.where(user_id: userid)
  end

  def self.user_contributed_concerts(userid)
    concert_ids = []
    user_concerts = []
    user_videos = Video.where(user_id: userid)
    user_videos.each do |video|
      concert_ids << video.concert_id
    end

    concert_ids.each do |concertid|
      user_concerts << Concert.find_by(id: concertid)
    end
    return user_concerts
  end

end
