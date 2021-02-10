require 'rails_helper'

describe 'New Meeting page' do
  it 'has a form to add a new presentation' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = gallery1.programs.create(name: "Painting Lillies", number_of_participants: 26)

    visit "/galleries/#{gallery1.id}/programs/new"

    expect(page).to have_content("New Meeting")
    expect(page).to have_selector('form')
    expect(page).to have_text('Meeting name:')
    expect(page).to have_field('mename')
    expect(page).to have_text('Number of Participants:')
    expect(page).to have_field('Number of Participants')

  end

  it 'has a button to Create Meeting' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = gallery1.programs.create(name: "Painting Lillies", number_of_participants: 26)

    visit "/galleries/#{gallery1.id}/programs/new"

    expect(page).to have_button('Create Meeting', type: 'submit')
  end

  describe 'site navigation' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = gallery1.programs.create(name: "Painting Lillies", number_of_participants: 26)

      visit "/galleries/#{gallery1.id}/programs/new"

      expect(page).to have_link("Art Museum Manager")
      expect(page).to have_link("Museum")
      expect(page).to have_link("Works")
      expect(page).to have_link("Galleries")
      expect(page).to have_link("Programs")
    end

    it 'navigates to the welcome page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create(name: "Painting Lillies", number_of_participants: 26)

      visit "/galleries/#{gallery1.id}/programs/new"

      click_on("Art Museum Manage")

      expect(page).to have_current_path('/')
    end

    it 'navigates to the galleries page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create(name: "Painting Lillies", number_of_participants: 26)

      visit "/galleries/#{gallery1.id}/programs/new"

      click_on("Galleries")

      expect(page).to have_current_path('/galleries')
    end

    it 'navigates to the programs page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create(name: "Painting Lillies", number_of_participants: 26)

      visit "/galleries/#{gallery1.id}/programs/new"

      click_on("Programs")

      expect(page).to have_current_path('/programs')
    end
  end
end
