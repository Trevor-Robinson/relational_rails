require 'rails_helper'

RSpec.describe 'edit galleries page' do
  it 'has a form to edit the attributes of the program room' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)


    visit "/galleries/#{gallery1.id}/edit"

    expect(page).to have_content("Update Gallery")
    expect(page).to have_selector('form')
    expect(page).to have_text("Gallery name")
    expect(page).to have_field(:name)
    expect(page).to have_text('Capacity')
    expect(page).to have_field(:capacity)
  end

  it 'updates the attributes of the gallery' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)


    visit "/galleries/#{gallery1.id}"
    click_on 'Update Gallery'
    expect(page).to have_button('Update Gallery', type: 'submit')

    fill_in(:name, with: 'Oprah')
    fill_in(:capacity, with: 30)
    click_on('Update Gallery')

    expect(page).to have_current_path("/galleries/#{gallery1.id}")
    expect(page).to have_content("Oprah")
  end

  describe 'site navigation' do
    it 'has a navigation bar with links to other index pages' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)


      visit "/galleries/#{gallery1.id}/edit"

      expect(page).to have_link("Art Museum Manager")
      expect(page).to have_link("Museum")
      expect(page).to have_link("Works")
      expect(page).to have_link("Galleries")
      expect(page).to have_link("Programs")
    end

    it 'navigates to the welcome page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)


      visit "/galleries/#{gallery1.id}/edit"

      click_on("Art Museum Manager")

      expect(page).to have_current_path('/')
    end

    it 'navigates to the galleries page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)


      visit "/galleries/#{gallery1.id}/edit"

      click_on("Galleries")

      expect(page).to have_current_path('/galleries')
    end

    it 'navigates to the program rooms page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)


      visit "/galleries/#{gallery1.id}/edit"

      click_on("Galleries")

      expect(page).to have_current_path('/galleries')
    end

    it 'navigates to the programs page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)


      visit "/galleries/#{gallery1.id}/edit"

      click_on("Programs")

      expect(page).to have_current_path('/programs')
    end
  end
end
