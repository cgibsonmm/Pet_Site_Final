class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile, dependent: :destroy

  has_many :photo_posts, dependent: :destroy

  validates :user_name, presence: true, length: {in: 5..12}

  before_validation :create_profile, on: :create

  def create_profile
    
  end
end
