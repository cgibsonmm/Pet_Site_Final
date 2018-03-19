class CreatePhotoPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_posts do |t|
      t.string :caption
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
