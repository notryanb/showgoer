class ArtistsController < ApplicationController

 def index
    @search = Artist.search(params[:q])
    @artists = @search.result
    @artistname = []
    @theartists = Artist.all
    @theartists.each do |artist|
     @artistname << artist.name
   end
   if request.xhr?
     @artistname
     render json:@artistname
   end
 end

end