class AddAttachmentImageToPhotoPosts < ActiveRecord::Migration[5.1]
  def self.up
    change_table :photo_posts do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :photo_posts, :image
  end
end
