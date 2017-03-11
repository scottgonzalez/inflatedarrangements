class CreateProductPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :product_photos do |t|
      t.references :product, null: false, foreign_key: true
      t.references :photo, null: false, foreign_key: true
      t.integer :order, null: false

      t.timestamps
    end
  end
end
