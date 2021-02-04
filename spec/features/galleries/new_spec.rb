require 'rails_helper'

describe 'As a visitor' do
  describe 'When i visit /galleries' do
    it 'I click a link to add a new gallery' do

      visit "/galleries"
      click_link "New Gallery"
      expect(current_path).to eq("/galleries/new")

      fill_in 'Name', with: 'Sculpture Gallery'
      fill_in 'Capacity', with: 25
      check 'tech_support'

      click_on 'Submit'

      expect(current_path).to eq("/galleries")
      expect(page).to have_content("Sculpture Gallery")
    end
  end
end
