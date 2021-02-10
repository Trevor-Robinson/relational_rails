require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit /programs' do
    it 'Shows the meeting and its attributes' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)

    visit '/programs'

    expect(page).to have_content("Programs")
    expect(page).to have_content(program1.name)
    expect(page).to have_content(program1.number_of_participants)
    end
  end

  it 'can show the programs associated with a given meeting_room' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)

    visit "/galleries/#{program1.id}/programs"

    expect(page).to have_content(program1.name)
  end

  it 'has a link to add a new meeting' do
    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)


   visit "/galleries/#{gallery1.id}/programs"

   expect(page).to have_link("Create Program")

   click_link("Create Program")

   expect(current_path).to eq("/galleries/#{gallery1.id}/programs/new")
 end

 it 'displays a count of the number of programs associated with the conference' do
   gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
   program1 = gallery1.programs.create(name: "Painting Lillies", number_of_participants: 26)

     visit "/galleries/#{gallery1.id}/programs"

     expect(page).to have_content("1 programs")
   end

   it 'shows all records above a given threshold' do
     gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
     program1 = gallery1.programs.create!(name: "Painting Lillies",number_of_participants: 26)
     program2 = gallery1.programs.create!(name: "Clay Sculpt", number_of_participants: 14)


     visit '/programs'

     expect(page).to have_field("number_of_participants")
     expect(page).to have_button("Only return records with more than minimum participants")

     fill_in("number_of_participants", with: 12)
     click_on("Only return records with more than minimum participants")

     expect(page).to have_content(program2.name)
     expect(page).not_to have_content(program1.name)
   end

   it 'sorts programs in alphabetical order' do
     gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
     program1 = gallery1.programs.create!(name: "Painting Lillies",number_of_participants: 26)
     program2 = gallery1.programs.create!(name: "Clay Sculpt", number_of_participants: 14)

      visit "/galleries/#{gallery1.id}/programs"
      expect(page).to have_link("Sort Alphabetically")
      click_on("Sort Alphabetically")
      expect(current_path).to eq("/galleries/#{gallery1.id}/programs")
      expect(program1.name).to appear_before(program2.name)
   end

   it 'has links to the edit page for each meeting' do
     gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
     program1 = gallery1.programs.create!(name: "Painting Lillies",number_of_participants: 26)
     program2 = gallery1.programs.create!(name: "Clay Sculpt", number_of_participants: 14)

     visit '/programs'

     within('#row-0') { expect(page).to have_link("Update Program") }
     within('#row-1') { expect(page).to have_link("Update Program") }

     within('#row-0') { click_on("Update Program") }

     expect(page).to have_current_path("/programs/#{program2.id}/edit")

     click_on("Update Program")

     expect(page).to have_current_path("/programs")
   end

   it 'has links to delete each presentation' do
     gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
     program1 = gallery1.programs.create!(name: "Painting Lillies",number_of_participants: 26)
     program2 = gallery1.programs.create!(name: "Clay Sculpt", number_of_participants: 14)

     visit '/programs'

     within('#row-0') { expect(page).to have_button("Delete Program") }
     within('#row-1') { expect(page).to have_button("Delete Program") }

     within('#row-0') { click_on("Delete Program") }

     expect(page).to have_current_path('/programs')
     expect(page).not_to have_content(program2.name)
     end

    describe 'site navigation' do
      it 'has a navigation bar with links to other index pages' do
        visit '/programs'

        expect(page).to have_link("Art Museum Manager")
        expect(page).to have_link("Museum")
        expect(page).to have_link("Works")
        expect(page).to have_link("Galleries")
        expect(page).to have_link("Programs")
      end

      it 'navigates to the welcome page' do
        visit '/programs'

        click_on("Art Museum Manager")

        expect(page).to have_current_path('/')
      end

      it 'navigates to the programs page' do
        visit '/programs'
        click_on("Programs")

        expect(page).to have_current_path('/programs')
      end

      it 'has links to navigate to galleries' do
        gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
        program1 = gallery1.programs.create!(name: "Painting Lillies",number_of_participants: 26)
        program2 = gallery1.programs.create!(name: "Clay Sculpt",number_of_participants: 14)

        visit '/programs'

        expect(page).to have_link(gallery1.name)

        click_on(gallery1.name)

        expect(page).to have_current_path("/galleries/#{gallery1.id}")
      end
    end
  end
