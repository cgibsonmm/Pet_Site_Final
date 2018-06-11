require 'rails_helper'

RSpec.feature 'Creating Animal' do
  before do
    @user = create(:user)
  end

  context 'Signed in user' do
    before do
      sign_in_with @user
      visit '/'
      click_link 'My Pets'
    end

    scenario 'user can create a new animal' do
      click_link 'Add new Pet'
      fill_in 'Name', with: 'Bailey'
      click_button 'Create Animal'
      expect(page).to have_content('Animal was successfully created.')
    end
  end
end
