class ProductPhoto < ApplicationRecord
  belongs_to :product
  belongs_to :photo

  before_save :ensure_order

  private

  def ensure_order
    return if order.present? || product.nil?

    max = ProductPhoto.where(product_id: product).maximum(:order)

    self.order = max.nil? ? 0 : (max + 1)
  end
end
