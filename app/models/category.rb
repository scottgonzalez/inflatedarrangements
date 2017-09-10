class Category < ApplicationRecord
  has_many :product_categories

  has_many :products, through: :product_categories

  validates :name, presence: true, uniqueness: true

  def product_count
    product_categories.count
  end
end
