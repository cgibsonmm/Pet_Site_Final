require 'rails_helper'
require 'files/site_description'

RSpec.feature 'Displaying home index spec' do
  before do
    visit '/'
  end
  context 'when not signed in' do
    scenario 'page should display nav bar' do
      expect(page).to have_css('.navbar')
    end

    pending 'page should display logo' do
      expect(page).to have_css('.logo')
    end

    scenario 'page should display website description' do
      expect(page).to have_css('.site-description')
      expect(page).to have_content(site_description)
    end

    scenario 'page should display footer' do
    end
  end
end
