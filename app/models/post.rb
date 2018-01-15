class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  # has_many :likes, as: :likeable

  # has_many :likers, through: :likes, source: :user
  mount_uploader :image, ImageUploader

  validates :image, file_size: { less_than: 5.megabytes }
end
