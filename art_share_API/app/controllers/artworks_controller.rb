class ArtworksController < ApplicationController
    def index
        if Artwork.artworks_for_user_id(:artist_id)
            # index of nested resource
            artworks = Artwork.artworks_for_user_id(:artist_id)
            # user = User.find(:artist_id)
            # artworks = user.artworks + user.shared_artworks
            # artworks = Artwork.where(artist_id: params[:artist_id])
        else
            # index of top-level resource
            artworks = Artwork.all
        end

        # shared = Artwork.artworks_for_user_id
    
        # render json: artworks
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