class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :product_photos
  has_many :photo_tags

  has_many :products, through: :product_photos
  has_many :tags, through: :photo_tags

  validates :description, presence: true
  validates :image, presence: true

  before_save :set_dimensions

  def wide?
    width > height
  end

  private

  def set_dimensions
    self.width, self.height = FastImage.size(image.path)
  end
end
