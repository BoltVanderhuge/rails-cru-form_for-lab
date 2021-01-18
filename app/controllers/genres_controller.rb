class GenresController < ApplicationController
  before_action :set_genre, only: [:show, :update, :edit]

  def new
    @genre = Genre.new
  end

  def create
    genre_new = Genre.create(genre_params(:name))
    if genre_new.valid?
      redirect_to genre_path(genre_new)
    else
      redirect_to new_genre_path
    end
  end
  
  def edit
  end
  
  def show
  end

  def update
    @genre.update(genre_params(:name))
    redirect_to genre_path(@genre)
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params(*args)
    params.require(:genre).permit(*args)
  end

end
