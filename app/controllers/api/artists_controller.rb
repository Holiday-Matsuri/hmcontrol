class Api::ArtistsController < ApplicationController
  def index
    @artists = Artist.where(convention_id: params[:convention_id])
  end
end