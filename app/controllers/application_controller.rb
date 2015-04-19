class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/' unless current_user
  end

  def user_videos
    @user_videos = Video.where(user_id: current_user.id)
  end
  helper_method :user_videos

  def user_contributed_concerts
    concert_ids = []
    user_concerts = []
    user_videos = Video.where(user_id: current_user.id)
    user_videos.each do |video|
      concert_ids << video.concert_id
    end

    concert_ids.each do |concertid|
      user_concerts << Concert.find_by(id: concertid)
    end
    return user_concerts
  end
  helper_method :user_contributed_concerts

end
