require "rails_helper"

RSpec.feature 'Adding new user' do
  before do
    visit '/'
    click_link 'sign_up_nav'
  end

  scenario 'Can successfully create a new user' do
    fill_in 'User name', with: 'testuser1'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("You are signed up, Please take a few mins to complete your profile")
  end

  scenario 'on user create site should redirect to create profile' do
    fill_in 'User name', with: 'testuser1'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("You are signed up, Please take a few mins to complete your profile")
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

  scenario 'user name needs to be more than 4 chars' do
    fill_in 'User name', with: 'a' * 13
    fill_in 'Email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("maximum is 12 characters")
  end

end
