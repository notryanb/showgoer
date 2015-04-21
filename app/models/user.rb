class User < ActiveRecord::Base
  has_secure_password
  has_many :likes
  has_many :attends
  has_many :dislikes
  has_many :videos
  has_many :comments
   has_many :originated_followings, class_name: 'Following', foreign_key: :originator_id
  has_many :received_followings, class_name: 'Following', foreign_key: :target_id

  has_many :people_followed, through: :originated_followings, source: :target
  has_many :followers, through: :received_followings, source: :originator

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

  def self.user_liked_videos(crt_usr)
    user_liked_video_ids = []
    user_liked_vds = []
    user_likes = crt_usr.likes
    user_likes.each do |concert|
      user_liked_video_ids << concert.video_id
     end
     user_liked_video_ids.each do |videoid|
      user_liked_vds << Video.find_by(id: videoid)
    end
    return user_liked_vds
  end

end
