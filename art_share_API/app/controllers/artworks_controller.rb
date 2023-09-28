class ArtworksController < ApplicationController
    def index
        if params.has_key?(:user_id)
            # index of nested resource
            artworks = Artwork.artworks_for_user_id(params[:user_id])
        else
            # index of top-level resource
            artworks = Artwork.all
        end

        render json: artworks.distinct
    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            redirect_to artwork_url(artwork.id)
        else 
            render artwork.errors.full_messages, status: 422
        end
    end 

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])

        if artwork.update(artwork_params)
            redirect_to artwork_url(artwork.id)
        else 
            render artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])

        if artwork && artwork.destroy
            render json: artwork
        else
            raise plain: 'artwork does not exist'
        end
    end

    private

    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end