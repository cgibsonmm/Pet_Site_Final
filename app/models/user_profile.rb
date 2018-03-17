class UserProfile < ApplicationRecord
  attr_accessor :skip_validation

  belongs_to :user
  validates :first_name, presence: true, length: { in: 2..12 }, unless: :skip_validation
  validates :last_name, presence: true, length: { in: 2..12 }, unless: :skip_validation
  validates :zip_code, presence: true, unless: :skip_validation # needs int validation
  validates :city, presence: true, length: { in: 2..12 }, unless: :skip_validation
  validates :state, presence: true, length: {is: 2}, unless: :skip_validation
  validates :country, presence: true, unless: :skip_validation

end
