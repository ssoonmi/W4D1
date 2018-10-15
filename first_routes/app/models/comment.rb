class Comment < ApplicationRecord
  validates :body, presence: true
  has_many :likes, as: :likeable

  belongs_to :author,
    foreign_key: :user_id,
    class_name: :User,
    dependent: :destroy

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork,
    dependent: :destroy
end
