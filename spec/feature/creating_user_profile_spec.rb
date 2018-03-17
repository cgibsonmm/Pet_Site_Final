require 'rails_helper'

RSpec.feature "Creating user profile" do
  def valid_user
    { first_name: 'valid',
      last_name: 'Valid',
      zip_code: 11221,
      city: 'Brooklyn',
      state: 'NY',
      country: 'USA',
      birthday: 1,   # Must Change to date time
      sex: 'male'
    }
  end

  before do
    user = create(:user)
    sign_in_with user
    visit 'users/1/user_profile/1/edit'
  end
  context "Valid user" do
    scenario 'can update to a valid user profile' do
      fill_in "First name", with: 'testName'
      fill_in "Last name", with: 'Nametest'
      fill_in "Zip Code", with: '12747'
      fill_in "City", with: 'Brooklyn'
      fill_in "State", with: 'NY'
      select('United States', from: 'Country')
      click_button 'Update User profile'
      expect(page).to have_css('div.flash.success')
    end
  end

  context "When not valid " do
    scenario 'first name, last name, zip code, city, state, and country must be present' do
      fill_in "First name", with: ''
      fill_in "Last name", with: ''
      fill_in "Zip Code", with: ''
      fill_in "City", with: ''
      fill_in "State", with: ''

      click_button 'Update User profile'
      expect(page).to have_css('div.flash.error')
      expect(page).to have_content("can't be blank")
    end
  end
end
