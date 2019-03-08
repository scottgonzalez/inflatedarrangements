class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  before_save :set_dimensions

  has_many :product_photos

  has_many :products, through: :product_photos

  validates :description, presence: true
  validates :image, presence: true

  private

  def set_dimensions
    self.width, self.height = FastImage.size image.path
  end
end
