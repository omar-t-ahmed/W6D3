class ArtworkSharesController < ApplicationController
    
    def create
        artwork_share = ArtworkShare.new(artwork_share_params)

        if artwork_share.save
            render json: artwork_share
        else 
            render plain: 'Artwork Share was not successfully created!'
        end

    end 

    def destroy
        artwork_share = ArtworkShare.find_by(id: params[:id])

        if artwork_share && artwork_share.destroy
            render json: artwork_share
        else
            raise plain: 'artwork share does not exist'
        end
    end

    private 

    def artwork_share_params
            params.require(:artwork_share).permit(:viewer_id, :artwork_id)
    end 
end