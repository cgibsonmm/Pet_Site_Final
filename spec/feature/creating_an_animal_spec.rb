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
      click_link 'Add new Pet'
    end

    scenario 'user can create a new animal' do
      fill_in 'Name', with: 'Bailey'
      page.select 'Dog', from: 'Species'
      click_button 'Create Animal'
      expect(page).to have_content('Animal was successfully created.')
    end

    scenario 'Name must be present to create animal' do
      fill_in 'Name', with: ''
      click_button 'Create Animal'
      expect(page).to have_content("can't be blank")
    end

    scenario 'Name must be within correct length' do
      fill_in 'Name', with: 'a' * 1
      click_button 'Create Animal'
      expect(page).to have_content("Name is too short")

      fill_in 'Name', with: 'q' * 13
      click_button 'Create Animal'
      expect(page).to have_content("Name is too long")
    end

    scenario 'Species must be present' do
      fill_in 'Name', with:'Bailey'
      page.select '', from: 'Species'
      click_button 'Create Animal'
      expect(page).to have_content "can't be blank"
    end
  end

  context 'No user signed in' do
    scenario 'can not create animal' do
      visit '/'
      expect(page).not_to have_content('My Pets')

      visit 'users/1/animals/new'

      expect(page).to have_content('You need to sign in')
    end
  end
end
