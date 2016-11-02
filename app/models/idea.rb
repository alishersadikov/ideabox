class Idea < ApplicationRecord
  validates :content, presence: true, uniqueness: true
  has_many :images, through: :ideas_images

  belongs_to :category
  belongs_to :user
end
