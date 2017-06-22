class RenameTagsToCategories < ActiveRecord::Migration[5.0]
  def change
    rename_table :tags, :categories

    rename_table :photo_tags, :photo_categories
    rename_column :photo_categories, :tag_id, :category_id

    rename_table :product_tags, :product_categories
    rename_column :product_categories, :tag_id, :category_id
  end
end
