require 'rails_helper'

RSpec.feature 'Edit Posts' do
  before do
    @user = create(:user)
    @user_2 = create(:user, email: 'email2@gmail.com', user_name: 'user2222',
                    password: 'testpass', id: 2)

    post = create(:photo_post, id: 1, user_id:1, caption: 'this is a caption')
    post2 = create(:photo_post, id: 2, user_id:2, caption: 'this is post 2')
  end

  def visit_posts
    click_link 'All Posts'
    expect(page).to have_content('this is a')
    expect(page).to have_content('this is post 2')
    find(:xpath, "//a[contains(@href, 'photo_posts/1')]").click
    click_link 'Edit Post'
  end

  context "when user signed in" do
    before do
      sign_in_with @user
      visit '/'
    end
    scenario "can edit a post they own" do
      visit_posts

      fill_in 'Caption', with: 'this should edit my post'
      click_button 'Update'

      expect(page).to have_content('Post Updated')
      expect(page).to have_content('this should edit my post')
    end
  end
end
