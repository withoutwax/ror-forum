class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, as: :likeable
  # has_many :likers, through: :likes, source: :user
end
