class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  has_many :likes, as: :likeable
  # has_many :liked_posts, through: :likes, source: :likeable, source_type: "Post"
  # has_many :liked_comments, through: :likes, source: :likeable, source_type: "Comment"

  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end

end
