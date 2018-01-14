class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  # has_many :liked_posts, through: :likes, source: :likeable, source_type: "Post"
  # has_many :liked_comments, through: :likes, source: :likeable, source_type: "Comment"

  def like!(likeable_obj)
    likes.where(likeable: likeable_obj).first_or_create
  end

  def unlike!(likeable_obj)
    likes.where(likeable: likeable_obj).destroy_all
  end


  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end

end
