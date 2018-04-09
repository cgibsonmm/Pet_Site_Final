require 'rails_helper'

RSpec.feature 'Adding comments to photo_posts' do
  before do
    @user = create(:user)
    user2 = create(:user, email: 'test@emaill.com',
                          user_name: 'testuser2', id: 2)
    @post = create(:photo_post, user_id: 2)
  end

  context 'when user signed in' do
    before do
      sign_in_with @user
      visit photo_posts_path
    end

    scenario 'user can add a comment to a post' do
      expect(page).to have_css("img[src*='pet_photo.jpg']")
      expect(page).to have_content('MyString')
      fill_in 'Add Comment', with: 'This photo is great!'
      click_button 'Submit'

      expect(page).to have_css("div#comments_#{@post.id}", text: 'This photo is great!')
    end
  end
end
