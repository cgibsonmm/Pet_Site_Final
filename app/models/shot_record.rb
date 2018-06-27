class ShotRecord < ApplicationRecord
  belongs_to :animal

  validates :name, presence: true
end
