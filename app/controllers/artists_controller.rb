class ArtistsController < ApplicationController

 def index
    search = Artist.search(params[:q])
    artists = search.result
    artist = artists.first
    redirect_to artist_path artist
 end

 def show
  @artist = Artist.find(params[:id])
 end

 def autocomplete_list
  list = Artist.pluck(:name)
  render json: list

 end

end