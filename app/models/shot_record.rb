class ShotRecord < ApplicationRecord
  belongs_to :animal

  validates :name, presence: { message: "Name can't be blank." }
end
