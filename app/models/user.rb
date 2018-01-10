class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  has_many :likes, as: :likeable
  # has_many :liked_posts, through: :likes, source: :likeable, source_type: "Post"
  # has_many :liked_comments, through: :likes, source: :likeable, source_type: "Comment"

end
