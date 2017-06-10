class Product < ApplicationRecord
  has_many :product_photos
  has_many :product_tags

  has_many :photos, through: :product_photos
  has_many :tags, through: :product_tags

  validates :name, presence: true
  validates :price, presence: true

  def primary_photo
    @primary_photo ||= photos
      .joins(:product_photos)
      .find_by(
        product_photos: {
          order: 0
        }
      )
  end

  def secondary_photos
    @secondary_photos = photos.where.not(id: primary_photo)
  end
end
