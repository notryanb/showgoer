class ArtistController < ApplicationController

  def index
  @Artists = @search.result
  redirect_to ''
  end

end