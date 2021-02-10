require 'rails_helper'

describe 'As a User' do
  describe 'When I visit /' do
    it 'Displays welcome message' do
    visit '/'

    expect(page).to have_link("Art Museum Manager")
    expect(page).to have_link("Museum")
    expect(page).to have_link("Works")
    expect(page).to have_link("Galleries")
    expect(page).to have_link("Programs")
    end
  end

  describe 'site navigation' do
    it 'navigates to the museums page' do
      visit '/'

      click_on("Museum")

      expect(page).to have_current_path('/museums')
    end

    it 'navigates to the galleries page' do
      visit '/'

      click_on("Galleries")

      expect(page).to have_current_path('/galleries')
    end

    it 'navigates to the works page' do
      visit '/'

      click_on("Works")

      expect(page).to have_current_path('/works')
    end

    it 'navigates to the programs page' do
      visit '/'

      click_on("Programs")

      expect(page).to have_current_path('/programs')
    end
  end
end
