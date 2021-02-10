require 'rails_helper'

describe 'as a visitor' do
  describe 'new gallery record page' do
    it 'displays a form for creating a new gallery record' do
      visit '/galleries/new'

      expect(page).to have_content("New Gallery")
      expect(page).to have_selector('form')
      expect(page).to have_field('metname', type: 'text')
      expect(page).to have_text('Capacity:')
      expect(page).to have_field('capacity', type: 'bigint')
    end

    it 'has a button to Create Gallery' do
      visit '/galleries/new'

      expect(page).to have_button('Create Gallery', type: 'submit')
    end

    it 'creates a new gallery and redirects to the galleries index' do
      visit '/galleries/new'

      fill_in('metname', with: 'Painting Gallery')
      fill_in('capacity', with: 30)
      click_on('Create Gallery')

      expect(page).to have_current_path('/galleries')
    end
    describe 'site navigation' do
      it 'has a navigation bar with links to other index pages' do
        visit "/galleries/new"

        expect(page).to have_link("Art Museum Manager")
        expect(page).to have_link("Museum")
        expect(page).to have_link("Works")
        expect(page).to have_link("Galleries")
        expect(page).to have_link("Programs")
      end

      it 'navigates to the welcome page' do
        visit "/galleries/new"

        click_on("Art Museum Manager")

        expect(page).to have_current_path('/')
      end

      it 'navigates to the galleries page' do
        visit "/galleries/new"

        click_on("Galleries")

        expect(page).to have_current_path('/galleries')
      end

      it 'navigates to the Galleries page' do
        visit "/galleries/new"

        click_on("Galleries")

        expect(page).to have_current_path('/galleries')
      end

      it 'navigates to the presentations page' do
        visit "/galleries/new"

        click_on("Programs")

        expect(page).to have_current_path('/programs')
      end

      it 'navigates to the programs page' do
        visit "/galleries/new"

        click_on("Programs")

        expect(page).to have_current_path('/programs')
      end
    end
  end
end
