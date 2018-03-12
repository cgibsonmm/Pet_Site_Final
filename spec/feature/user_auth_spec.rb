require 'rails_helper'

RSpec.feature 'User Authentication' do
  before do
    user = create(:user)
  end

  scenario 'User can sign in' do
    visit '/'
    expect(page).not_to have_content('Log out')
    click_link 'Sign In'

    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
  end
end
