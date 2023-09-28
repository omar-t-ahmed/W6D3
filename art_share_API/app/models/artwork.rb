# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :image_url, presence: true, uniqueness: true
    validates :artist_id, uniqueness: {scope: :title, message: "Artwork title must be unique for given artist"}

    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

     def self.artworks_for_user_id(artist_id)
        Artwork.select(:title).left_outer_joins(:artwork_shares).where("artworks.artist_id = ? OR artwork_shares.viewer_id = ?", artist_id, artist_id).distinct
    #     user = User.find_by(id: :artist_id)
    #     User.all.where("viewer = artist_id")
    #     # user.shared_artworks    
    #     user = User.find(:artist_id)
    #     artworks = user.artworks + user.shared_artworks

    #     Artwork
    #         .select(:shared_artworks)
    #         .joins("artwork.id = artwork_shares.artwork_id")
    #         .where()

     end
end
