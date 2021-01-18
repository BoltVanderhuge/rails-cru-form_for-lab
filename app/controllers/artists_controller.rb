class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :update, :edit]

  def new
    @artist = Artist.new
  end

  def create
    artist_new = Artist.create(artist_params(:name,:bio))
    if artist_new.valid?
      redirect_to artist_path(artist_new)
    else
      redirect_to new_artist_path
    end
  end

  def edit
  end

  def show
  end

  def update
    @artist.update(artist_params(:name,:bio))
    redirect_to artist_path(@artist)
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params(*args)
    params.require(:artist).permit(*args)
  end

end
