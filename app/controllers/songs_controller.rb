class SongsController < ApplicationController
  before_action :set_song, only: [:show, :update, :edit]

  def index
  @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    song_new = Song.create(song_params(:name))
    if song_new.valid?
      redirect_to song_path(song_new)
    else
      redirect_to new_song_path
    end
  end

  def show
  end

  def edit
  end
  
  def update
    @song.update(song_params(:name))
    redirect_to song_path(@song)
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
