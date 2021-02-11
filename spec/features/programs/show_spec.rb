require 'rails_helper'

RSpec.describe 'show meeting page' do
  it 'displays the meeting with a given id and its attributes' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


    visit "/programs/#{program1.id}"

    expect(page).to have_content(program1.name)
    expect(page).to have_content(program1.number_of_participants)
  end

  describe 'site navigation' do
    it 'has a navigation bar with links to other index pages' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


      visit "/programs/#{program1.id}"

      expect(page).to have_link('Art Museum Manager')
      expect(page).to have_link('Museum')
      expect(page).to have_link('Works')
      expect(page).to have_link('Galleries')
      expect(page).to have_link('Programs')
    end

    it 'navigates to the welcome page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


      visit "/programs/#{program1.id}"

      click_on("Art Museum Manager")

      expect(page).to have_current_path('/')
    end

    it 'navigates to the galleries page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


      visit "/programs/#{program1.id}"

      click_on("Galleries")

      expect(page).to have_current_path('/galleries')
    end

    it 'navigates to the meeting rooms page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


      visit "/programs/#{program1.id}"

      click_on("Galleries")

      expect(page).to have_current_path('/galleries')
    end

    it 'navigates to the programs page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


      visit "/programs/#{program1.id}"

      click_on("Programs")

      expect(page).to have_current_path('/programs')
    end

    it 'navigates to the programs page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


      visit "/programs/#{program1.id}"

      click_on("Programs")

      expect(page).to have_current_path('/programs')
    end

    it 'has a link to view its meeting_room' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


      visit "/programs/#{program1.id}"

      expect(page).to have_link(gallery1.name)

      click_on(gallery1.name)

      expect(page).to have_current_path("/galleries/#{gallery1.id}")
    end

    it 'has a link to itself' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


      visit "/programs/#{program1.id}"

      expect(page).to have_link(program1.name)

      click_on(program1.name)

      expect(page).to have_current_path("/programs/#{program1.id}")
    end
  end
end
