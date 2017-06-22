class PhotoCategory < ApplicationRecord
  belongs_to :category, required: true
  belongs_to :photo, required: true
end
