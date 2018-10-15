class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.where(artist_id: params[:user_id])
    @shared_artworks = User.find(params[:user_id]).shared_artworks
    render json: [@artworks, @shared_artworks]
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  end

  def update
    if Artwork.update(params[:id],artwork_params)
      @artwork = Artwork.find(params[:id])
      render json: @artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    if @artwork.delete
      render json: Artwork.all
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

private
  def artwork_params
    params.require(:artwork).permit(:artist_id, :title,:image_url)
  end
end
