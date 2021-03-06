class Animal < ApplicationRecord
  belongs_to :user
  has_many   :shot_records

  has_attached_file :image, styles: { medium: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  crop_attached_file :image

  validates :name, presence: true, length: { in: 3..12 }
  validates :species, presence: true
end
