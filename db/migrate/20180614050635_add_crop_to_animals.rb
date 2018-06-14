class AddCropToAnimals < ActiveRecord::Migration[5.1]
  def change
    add_column :animals, :image_original_w, :integer
    add_column :animals, :image_original_h, :integer
    add_column :animals, :image_crop_x, :integer
    add_column :animals, :imgae_crop_y, :integer
    add_column :animals, :image_crop_h, :integer
    add_column :animals, :image_crop_w, :integer
  end
end
