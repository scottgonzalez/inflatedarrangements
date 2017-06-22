class Category < ApplicationRecord
  has_many :photo_categories
  has_many :product_categories

  has_many :photos, through: :photo_categories
  has_many :products, through: :product_categories

  validates :name, presence: true, uniqueness: true

  def photo_count
    photo_categories.count
  end

  def product_count
    product_categories.count
  end
end
