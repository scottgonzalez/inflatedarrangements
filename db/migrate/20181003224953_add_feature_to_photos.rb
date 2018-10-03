class AddFeatureToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :feature, :boolean
  end
end
