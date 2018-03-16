require 'rails_helper'

RSpec.feature 'User Authentication' do
  before do
    @user = create(:user)
    visit '/'
    expect(page).not_to have_content('Log out')
    click_link 'Sign In'
  end

  scenario 'User can sign in' do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully')
    expect(page).not_to have_content('Sign In')
    expect(page).to have_content('Sign Out')
  end

  scenario 'User can sign out' do
    sign_in_with @user
    visit '/'

    expect(page).not_to have_content('Sign In')
    click_link 'Sign Out'
    expect(page).to have_content('Signed out successfully')
    expect(page).to have_content('Sign In')

  end

  scenario 'invalid user can not sign in' do
    fill_in 'Email', with: 'notreg@test.com'
    fill_in 'Password', with: 'testpassword'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email')
    expect(page).not_to have_content('Log out')
  end
end
