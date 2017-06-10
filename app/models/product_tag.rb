class ProductTag < ApplicationRecord
  belongs_to :product
  belongs_to :tag

  after_save :tag_photos

  private

  def tag_photos
    product.photos.each do |photo|
      photo.tags << tag unless photo.tags.include? tag
    end
  end
end
