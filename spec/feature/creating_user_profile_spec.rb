require 'rails_helper'

RSpec.feature "Creating user profile" do
  before do
    user = create(:user)
    sign_in_with user
  end
  scenario 'can update to a valid user profile' do
    visit 'users/1/user_profile/1/edit'

    fill_in "First name", with: 'testName'
    fill_in "Last name", with: 'Nametest'
    click_button 'Update User profile'
    expect(page).to have_css('div.success.flash')
  end
end
