require 'rails_helper'

RSpec.feature 'Creating Photo Post' do
  before do
    @user = create(:user)
  end

  context 'Signed in user' do
    before do
      sign_in_with @user
      visit '/'
      click_link 'New Post'
    end

    scenario 'can create a new post' do
      attach_file('Image', 'spec/files/images/pet_photo.jpg')
      fill_in 'Caption', with: 'Test photo'
      click_button 'Create'

      expect(page).to have_content('Successfully, created post take a few seconds and crop it.')
      expect(page).to have_css("img[src*='pet_photo']")
      click_button 'Save'

      expect(page).to have_content('Post Updated')
      expect(page).to have_content(@user.user_name)
      expect(page).to have_css("img[src*='pet_photo']")
    end

    scenario 'Image must be present' do
      fill_in 'Caption', with: 'There is no photo'
      click_button 'Create'

      expect(page).to have_css('div.flash.error')
      expect(page).to have_content('Error, creating post')
    end
  end

  context 'User not signed in' do
    scenario 'will be redirect to sign in' do
      visit '/'
      click_link 'New Post'

      expect(page).to have_content('You need to sign in or sign up before')
    end
  end
end
