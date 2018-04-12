require 'rails_helper'

RSpec.feature 'Photo_Post Index' do
  before do
    user = create(:user)
    user2 = create(:user, email: 'test111@test.com', user_name: 'tthee', id: 2)
    build_a_bunch_of_photos(user)
    build_a_bunch_of_photos(user2)
  end

  def build_a_bunch_of_photos(user)
    5.times do
      create(:photo_post, user_id: user.id)
    end
  end

  context 'not user session' do
    scenario 'can view the index page' do
      visit photo_posts_path
      expect(page).to have_css(".image.box")
    end
  end
end
