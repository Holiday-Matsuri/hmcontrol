class Api::ArtistsController < ApplicationController
  before_action :set_active_convention!
  def index
    @artists = Artist.where(convention_id: @convention.id).order(Artist.arel_table['artist_name'].lower.asc).group_by{|u| u.artist_name[0].upcase}
  end
end