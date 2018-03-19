require 'rails_helper'

RSpec.feature 'Creating Photo Post' do
  context 'Signed in user' do
    before do
      @user = create(:user)
      sign_in_with @user
      visit '/'
    end
    scenario 'can creat a new post' do
      click_link 'New Post'

      attach_file('Image', 'spec/files/images/pet_photo.jpg')
      fill_in 'Caption', with: 'Test photo'
      click_button 'Create'

      expect(page).to have_content('Successfully, created post take a few seconds and crop it.')
      expect(page).to have_css("img[src*='pet_photo']")
      click_button 'Save'

      expect(page).to have_content('Successfully, cropped photo')
      expect(page).to have_content(@user.user_name)
      expect(page).to have_css("img[src*='pet_photo']")
    end
  end
end
