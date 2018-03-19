class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :photo_posts, dependent: :destroy

  after_save :create_user_profile, on: :create

  validates :user_name, presence: true, length: {in: 5..12}

  private

  def create_user_profile
    @user_profile = UserProfile.create(user_id: self.id)
    @user_profile.skip_validation = true
    @user_profile.save
  end
end
