class ArtistsController < ApplicationController

 def index
  search = Artist.search(params[:q])
  artists = search.result
  artist = artists.first
  redirect_to artist_path artist
end

def show
  @artist = Artist.find(params[:id])
  @artist_past_concerts = Artist.past_concerts(@artist.name)
  @artist_future_concerts = Artist.future_concerts(@artist.name)

  case params[:sort_type]
  when "newest"
    @artist_past_concerts.order(date_time: :desc)
  when "oldest"
    @artist_past_concerts.order(date_time: :asc)
  end
end

def autocomplete_list
  list = Artist.pluck(:name)
  render json: list
end

end