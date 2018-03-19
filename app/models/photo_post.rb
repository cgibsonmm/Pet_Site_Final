class PhotoPost < ApplicationRecord
  belongs_to :user

  has_attached_file :image, styles: { medium: "400x400>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  crop_attached_file :image

  validates :image, presence: true
end
