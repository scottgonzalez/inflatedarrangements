class AddWidthAndHeightToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :width, :integer
    add_column :photos, :height, :integer
  end
end
