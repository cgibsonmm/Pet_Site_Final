require 'rails_helper'

RSpec.feature 'Creating a shot record for animal' do
  context 'signed in user with an animal' do
    before do
      @user = create(:user)
      @animal = create(:animal, user_id: 1)
      sign_in_with @user

      visit '/'
      click_link 'My Pets'
    end

    scenario 'can create a shot record' do
      click_on('Add Shot')
      expect(page).to have_content('Fill in Record information')

      fill_in 'Shot Name', with: 'Rabies'
      choose '1 Year'
      click_button 'Create Shot record'

      expect(page).to have_content('Successfully created Shot Record')
      expect(page).to have_content('Rabies')
      expect(page).to have_content('Due in 1 Year.')
    end
  end
end
