require 'rails_helper'
require 'faker'

RSpec.feature 'Showing User Profile' do
  before do
    @user_profile = create(:user_profile)
    @user2 = create(:user, user_name: 'testuser2', email: Faker::Internet.email, id:2)
  end

  context 'Signed in user' do
    before do
      sign_in_with @user_profile.user
    end

    scenario 'can view their own profile' do
      click_link 'My Account'
      click_link 'My Profile'

      expect(page).to have_content(@user_profile.user.user_name)
    end
  end
end
