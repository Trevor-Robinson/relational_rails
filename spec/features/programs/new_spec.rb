require 'rails_helper'

describe 'New Program page' do
  it 'has a form to add a new program' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


    visit "/galleries/#{gallery1.id}/programs/new"

    expect(page).to have_content("New Program")
    expect(page).to have_selector('form')
    expect(page).to have_text('Program name:')
    expect(page).to have_field(:name)
    expect(page).to have_text('Number of participants')
    expect(page).to have_field(:number_of_participants)

  end

  it 'has a button to Create Program' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


    visit "/galleries/#{gallery1.id}/programs/new"

    expect(page).to have_button('Create Program', type: 'submit')
  end

  describe 'site navigation' do
    it 'has a navigation bar with links to other index pages' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)

      visit "/galleries/#{gallery1.id}/programs/new"

      expect(page).to have_link('Art Museum Manager')
      expect(page).to have_link('Museum')
      expect(page).to have_link('Works')
      expect(page).to have_link('Galleries')
      expect(page).to have_link('Programs')

    end

    it 'navigates to the welcome page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)

      visit "/galleries/#{gallery1.id}/programs/new"

      click_on("Art Museum Manager")

      expect(page).to have_current_path('/')
    end

    it 'navigates to the galleries page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)

      visit "/galleries/#{gallery1.id}/programs/new"

      click_on("Galleries")

      expect(page).to have_current_path('/galleries')
    end

    it 'navigates to the programs page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)

      visit "/galleries/#{gallery1.id}/programs/new"

      click_on("Programs")

      expect(page).to have_current_path('/programs')
    end
  end
end
