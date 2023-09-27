class ArtworksController < ApplicationController
    def index
        artworks = Artwork.all
        render json: artworks
    end

    def create
        artwork = Artwork.new
        
        if artwork.save
            redirect_to artwork_url(artwork)
        else 
            render artwork.errors.full_messages, status: 422
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
    end

    def destroy
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end