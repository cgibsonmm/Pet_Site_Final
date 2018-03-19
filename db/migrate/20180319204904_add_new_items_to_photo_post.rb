class AddNewItemsToPhotoPost < ActiveRecord::Migration[5.1]
  def change
    add_column :photo_posts, :image_original_w, :integer
    add_column :photo_posts, :image_original_h, :integer
    add_column :photo_posts, :image_crop_x, :integer
    add_column :photo_posts, :image_crop_y, :integer
    add_column :photo_posts, :image_crop_w, :integer
    add_column :photo_posts, :image_crop_h, :integer
  end
end
