class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :product_photos

  has_many :products, through: :product_photos

  validates :description, presence: true
  validates :image, presence: true
end
