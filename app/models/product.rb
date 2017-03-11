class Product < ApplicationRecord
  has_many :product_photos
  has_many :product_tags

  has_many :photos, through: :product_photos
  has_many :tags, through: :product_tags

  validates :name, presence: true
  validates :price, presence: true
end
