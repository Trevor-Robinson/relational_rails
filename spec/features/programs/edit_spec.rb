require 'rails_helper'

describe 'Edit Program page' do
  it 'has a form to edit the program' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = Gallery.programs.create(name: "Painting Lillies",number_of_participants: 26)

    visit "/programs/#{program1.id}/edit"

    expect(page).to have_content("Update Program #{program1.name}")
    expect(page).to have_selector('form')
    expect(page).to have_text('Program Name:')
    expect(page).to have_field('mename', type: 'text')
  end

  it 'updates the attributes of the program' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = Gallery.programs.create(name: "Painting Lillies",number_of_participants: 26)

    visit "/programs/#{program1.id}"

    click_on('Update Program')
    expect(page).to have_button('Update Program', type: 'submit')
    fill_in('mename', with: 'Painting Lillies')

    click_on('Update Program')

    expect(page).to have_current_path("/programs/#{program1.id}")
  end

  it 'allows you to individual attributes of the program' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = Gallery.programs.create(name: "Painting Lillies",number_of_participants: 26)

    visit "/programs/#{program1.id}"
    click_on('Update Program')

    fill_in 'Program Name', with: 'Finger Paint'
    click_on('Update Program')

    expect(page).to have_content("Finger Paint")
    end
  end
  describe 'site navigation' do
    it 'has a navigation bar with links to other index pages' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = Gallery.programs.create(name: "Painting Lillies",number_of_participants: 26)

      visit "/programs/#{program1.id}/edit"

      expect(page).to have_link("Art Museum Manager")
      expect(page).to have_link("Museum")
      expect(page).to have_link("Works")
      expect(page).to have_link("Galleries")
      expect(page).to have_link("Programs")
    end

    it 'navigates to the welcome page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = Gallery.programs.create(name: "Painting Lillies",number_of_participants: 26)

      visit "/programs/#{program1.id}/edit"

      click_on("Art Museum Manager")

      expect(page).to have_current_path('/')
    end

    it 'navigates to the galleries page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = Gallery.programs.create(name: "Painting Lillies",number_of_participants: 26)

      visit "/programs/#{program1.id}/edit"

      click_on("Galleries")

      expect(page).to have_current_path('/galleries')
    end

    it 'navigates to the programs page' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = Gallery.programs.create(name: "Painting Lillies",number_of_participants: 26)

      visit "/programs/#{program1.id}/edit"

      click_on("Programs")

      expect(page).to have_current_path('/programs')
    end
  end
