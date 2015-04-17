class ArtistsController < ApplicationController

  def index
    @search = Artist.search(params[:q])
    @artists = @search.result
  end

end