require 'rails_helper'

RSpec.feature 'Edit Posts' do
  before do
    @user = create(:user)
    @user_2 = create(:user, email: 'email2@gmail.com', user_name: 'user2222',
                            password: 'testpass', id: 2)

    post = create(:photo_post, id: 1, user_id: 1, caption: 'this is a caption')
    post2 = create(:photo_post, id: 2, user_id: 2, caption: 'this is post 2')
  end

  def visit_posts
    click_link 'All Posts'
    first('.post1_link').click
  end

  context 'when user signed in' do
    before do
      sign_in_with @user
      visit '/'
    end
    scenario 'can edit a post they own' do
      visit_posts

      click_link 'Edit Post'
      fill_in 'Caption', with: 'this should edit my post'
      click_button 'Update'

      expect(page).to have_content('Post Updated')
      expect(page).to have_content('this should edit my post')
    end

    scenario 'must own post to edit post through link' do
      click_link 'All Posts'
      find(:xpath, "//a[contains(@href, 'photo_posts/2')]").click
      expect(page).not_to have_content('Edit Post')
    end

    scenario 'must own link to display edit through url' do
      visit '/photo_posts/2/edit'
      expect(page).to have_content('You must own post to edit.')
    end
  end
end
