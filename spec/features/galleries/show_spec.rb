require 'rails_helper'

describe 'as a visitor' do
  describe 'show gallery page' do
    it 'displays the gallery with that id and its attributes' do
      gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

      visit "/galleries/#{gallery1.id}"

      expect(page).to have_content(gallery1.name)
    end

    it 'has a link to update the gallery' do
      gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

      visit "/galleries/#{gallery1.id}"

      expect(page).to have_link("Update Gallery", href: "/galleries/#{gallery1.id}/edit")

      click_link("Update Gallery")

      expect(page).to have_current_path("/galleries/#{gallery1.id}/edit")
    end

    it 'can delete the Gallery record' do
      gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

      visit "/galleries/#{gallery1.id}"

    expect(page).to have_link("View Meetings")

    click_on("View Meetings")

    expect(page).to have_current_path("/galleries/#{gallery1.id}/programs")

    describe 'site navigation' do
      it 'has a navigation bar with links to other index pages' do
        gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

        visit "/galleries/#{gallery1.id}"

        expect(page).to have_link("Art Museum Manager")
        expect(page).to have_link("Museum")
        expect(page).to have_link("Works")
        expect(page).to have_link("Galleries")
        expect(page).to have_link("Programs")
      end

      it 'navigates to the welcome page' do
        gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

        visit "/galleries/#{gallery1.id}"

        click_on("Art Museum Manager")

        expect(page).to have_current_path('/')
      end

      it 'navigates to the galleries page' do
        gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

        visit "/galleries/#{gallery1.id}"

        click_on("Galleries")

        expect(page).to have_current_path('/galleries')
      end

      it 'navigates to the galleries page' do
        gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

        visit "/galleries/#{gallery1.id}"

        click_on("Galleries")

        expect(page).to have_current_path('/galleries')
      end

      it 'navigates to the   page' do
        gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

        visit "/galleries/#{gallery1.id}"

        click_on("Programs")

        expect(page).to have_current_path('/programs')
      end

      it 'navigates to the programs page' do
        gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

        visit "/galleries/#{gallery1.id}"

        click_on("Programs")

        expect(page).to have_current_path('/programs')
      end

      it 'has a link to view its  ' do
        gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

        visit "/galleries/#{gallery1.id}"

        expect(page).to have_link("Programs")

        click_on("Programs")

        expect(page).to have_current_path("/galleries/#{gallery1.id}/programs")
      end

      it 'has a link to itself' do
        gallery1 = Gallery.create!(name: "Painting Gallery", capacity: 30, tech_support: true)

        visit "/galleries/#{gallery1.id}"

        expect(page).to have_link(gallery1.name)

        click_on(gallery1.name)

        expect(page).to have_current_path("/galleries/#{gallery1.id}")
      end
    end
  end
end
