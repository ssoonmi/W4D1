class User < ApplicationRecord
  validates :username, presence: true

  #artist
  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork

  #viewer
  has_many :artwork_views,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_artworks,
    through: :artwork_views,
    source: :artwork

  has_many :comments,
    foreign_key: :user_id,
    class_name: :Comment

  has_many :likes,
    foreign_key: :user_id,
    class_name: :Like

  has_many :liked_comments,
    through: :likes,
    source: :likeable,
    source_type: :Comment

  has_many :liked_artworks,
    through: :likes,
    source: :likeable,
    source_type: :Artwork
end
