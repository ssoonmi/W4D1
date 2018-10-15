class ArtworkShare < ApplicationRecord
  validates :artwork_id, uniqueness: {scope: :viewer_id,
    message: 'viewer cannot view arwork more than once'}
  validates :artwork_id, :viewer_id, presence: true

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User,
    dependent: :destroy

  has_one :artist,
    through: :artwork,
    source: :artist,
    dependent: :destroy
end
