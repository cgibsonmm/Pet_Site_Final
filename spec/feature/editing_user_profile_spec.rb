require 'rails_helper'

RSpec.feature 'Editing User Profile' do
  before do
    @user = create(:user)
    user2 = create(:user, email: 'test@email.com', user_name: 'testueser' ,id: 2)

  end

  context 'Signed in user' do
    before do
      sign_in_with @user
    end

    scenario 'can edit their profile' do
      click_button 'My Account'
      click_link 'My Profile'
      click_link 'Edit My Profile'

      fill_in 'First name', with: 'Corey'
      fill_in 'Last name', with: 'Gibson'
      fill_in 'Zip Code', with: '11221'
      fill_in 'City', with: 'Brooklyn'
      fill_in 'State', with: 'NY'
      select('United States', from: 'Country')
      click_button 'Update'

      expect(page).to have_content("Profile Updated")
    end
  end
end
