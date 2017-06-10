class Tag < ApplicationRecord
  has_many :photo_tags
  has_many :product_tags

  has_many :photos, through: :photo_tags
  has_many :products, through: :product_tags

  validates :name, presence: true, uniqueness: true

  def photo_count
    photo_tags.count
  end

  def product_count
    product_tags.count
  end
end
