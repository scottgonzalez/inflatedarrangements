class Product < ApplicationRecord
  has_many :product_categories
  has_many :product_photos

  has_many :categories, through: :product_categories
  has_many :photos, through: :product_photos

  validates :name, presence: true
  validates :price, presence: true

  accepts_nested_attributes_for :photos

  def primary_photo
    @primary_photo ||= photos
      .joins(:product_photos)
      .find_by(
        product_photos: {
          order: 0
        }
      )
  end
end
