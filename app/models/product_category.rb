class ProductCategory < ApplicationRecord
  belongs_to :category
  belongs_to :product

  after_save :categorize_photos

  private

  def categorize_photos
    product.photos.each do |photo|
      photo.categories << category unless photo.categories.include? category
    end
  end
end
