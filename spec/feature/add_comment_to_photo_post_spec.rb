require 'rails_helper'

RSpec.feature 'Adding comments to photo_posts' do
  before do
    @user = create(:user)
    @user2 = create(:user, email: 'test@emaill.com',
                          user_name: 'testuser2', id: 2)
    @post = create(:photo_post, user_id: 2)
  end

  context 'when user signed in' do
    before do
      sign_in_with @user
      visit photo_posts_path
    end

    scenario 'user can add a comment to a post' do
      find('.post1_link').click
      expect(page).to have_content(@user2.user_name)

      fill_in 'Add Comment', with: 'This is a great photo!'
      find('#commentSubmit').click

      find('.post1_link').click
      expect(page).to have_content('This is a great photo!')
    end
  end
end
