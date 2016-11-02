class Image < ApplicationRecord
  validates :url, presence: true, uniqueness: true

  has_many :ideas, through: :ideas_images

  mount_uploader :avatar, AvatarUploader
end
