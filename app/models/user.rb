class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :user_profile, dependent: :destroy
  has_many :comments
  has_many :animals

  after_create :build_user_profile

  has_many :photo_posts, dependent: :destroy

  validates :user_name, presence: true, length: { in: 5..12 }

  private

  def build_user_profile
    default_params = {
      first_name:   'default',
      last_name:    'default',
      city:         'default',
      state:        'NA',
      country:      'default',
      zip_code:     11_111,
      sex:          'default'
    }
    @profile = create_user_profile!(default_params)
  end
end
