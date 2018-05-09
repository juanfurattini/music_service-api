class MusicalGenresController < ApplicationController
  before_action :set_musical_genre, only: [:show, :update, :destroy]

  # GET /musical_genres
  def index
    @musical_genres = MusicalGenre.all

    render json: @musical_genres
  end

  # GET /musical_genres/1
  def show
    render json: @musical_genre
  end

  # POST /musical_genres
  def create
    @musical_genre = MusicalGenre.new(musical_genre_params)

    if @musical_genre.save
      render json: @musical_genre, status: :created, location: @musical_genre
    else
      render json: @musical_genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /musical_genres/1
  def update
    if @musical_genre.update(musical_genre_params)
      render json: @musical_genre
    else
      render json: @musical_genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /musical_genres/1
  def destroy
    @musical_genre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_musical_genre
      @musical_genre = MusicalGenre.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def musical_genre_params
      params.require(:musical_genre).permit(:name)
    end
end
