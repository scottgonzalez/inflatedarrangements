class ProductPhoto < ApplicationRecord
  belongs_to :product
  belongs_to :photo
end
