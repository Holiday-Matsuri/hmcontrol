class Admin::ArtistsController < Admin::AdminController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  def index
    @artists = Artist.where(convention_id: @convention.id)
  end

  def new
    @artist = Artist.new
  end
  
  def create
    @artist = Artist.new(artist_params)
    @artist.convention = @convention
    if @artist.save
      flash[:success] = "Artist #{@artist.artist_name} has been added"
      redirect_to new_admin_artist_path
    else
      flash[:danger] = "Error Saving Artist"
      render :new
    end
  end

  def show
    # show action 
  end

  def edit
    # edit action
  end

  def update
    @artist.update(artist_params)
    if @artist.save
      flash[:success] = "Artist Updated Successfully"
      redirect_to admin_artist_path(@artist)
    else
      flash[:danger] = "Error"
      render :update
    end
  end

  def destroy
    @artist.delete
    redirect_to admin_artists_path
  end
  private
  def set_artist
    @artist = Artist.find(params[:id])
  end
  def artist_params
    params.require(:artist).permit(:artist_name, :artist_location)
  end
  
  
end