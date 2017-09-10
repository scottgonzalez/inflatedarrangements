class DropPhotoCategories < ActiveRecord::Migration[5.0]
  def change
    drop_table :photo_categories
  end
end
