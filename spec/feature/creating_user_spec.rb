require "rails_helper"

RSpec.feature 'Adding new user' do
  before do
    visit '/'
    click_link 'Sign Up'
  end

  scenario 'Can successfully create a new user' do
    fill_in 'User name', with: 'testuser1'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'user needs a user name to sign up' do
    fill_in 'User name', with: ''
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("can't be blank")
  end

  scenario 'user name needs to be more than 4 chars' do
    fill_in 'User name', with: 'aaa'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("minimum is 5 characters")
  end
end
