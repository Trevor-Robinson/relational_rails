require 'rails_helper'

describe 'as a visitor' do
  describe 'galleries index page' do
    it "can see the name of each gallery record in the system" do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)

      visit "/galleries"

      expect(page).to have_content("Galleries")
      expect(page).to have_link(gallery1.name, href: "/galleries/#{gallery1.id}")
    end

    it "has a link to create a new Gallery record" do
      visit "/galleries"

      expect(page).to have_link("New Gallery", href: '/galleries/new')
    end

    it "navigates to the /meeting_room page from the link to create a new gallery" do
      visit "/galleries"

      click_link("New Gallery")

      expect(page).to have_current_path('/galleries/new')
    end

  it 'When I visit the index page sorts records datatime by most recently created and I see the created date' do

    gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
    gallery2 = Gallery.create!(name: "Clay Gallery", capacity: 15, tech_support: true)

    visit '/galleries'
    expect(gallery2.name).to appear_before(gallery1.name)
  end

it 'Shows records that have a true value before records that have false' do
  gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
  gallery2 = Gallery.create!(name: "Clay Gallery", capacity: 15, tech_support: true)
  visit '/galleries'

  expect(gallery2.name).to appear_before(gallery1.name)
end

it 'shows all records above a given threshold' do
  gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
  gallery2 = Gallery.create!(name: "Clay Gallery", capacity: 15, tech_support: true)

  visit '/galleries'

  expect(page).to have_field("capacity")
  expect(page).to have_button("Only return records with more than the minimum capacity")

  fill_in("capacity", with: 25)
  click_on("Only return records with more than the minimum capacity")

  expect(page).to have_content(gallery1.name)
  expect(page).not_to have_content(gallery2.name)
end
it 'sorts galleries by number of programs' do
  gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
  gallery2 = Gallery.create!(name: "Clay Gallery", capacity: 15, tech_support: true)

  program1 = gallery1.programs.create!(name: "Painting Lillies", number_of_participants: 26)
  program2 = gallery2.programs.create!(name: "Instagram Photos", number_of_participants: 26)

    visit '/galleries'
    expect(page).to have_link("Sort by Number of Programs")
    click_on("Sort by Number of Programs")

    expect(current_path).to eq('/galleries')
    expect(gallery2.name).to appear_before(gallery1.name)

  end
    it 'has a link to the edit page for each gallery' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      gallery2 = Gallery.create!(name: "Clay Gallery", capacity: 15, tech_support: true)
      visit '/galleries'

      within('#row-0') { expect(page).to have_link("Update Gallery") }
      within('#row-1') { expect(page).to have_link("Update Gallery") }

      within('#row-0') { click_on("Update Gallery") }

      expect(page).to have_current_path("/galleries/#{gallery2.id}/edit")

      click_on("Update Gallery")

      expect(page).to have_current_path("/galleries")
    end
    it 'has a link to delete each gallery' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)

      visit '/galleries'

      within('#row-1') { expect(page).to have_button("Delete Gallery") }


       click_on("Delete Gallery")

      expect(page).to have_current_path('/galleries')
      expect(page).not_to have_content(gallery1.name)
    end

    describe 'site navigation' do
      it 'has a navigation bar with links to other index pages' do
        visit '/galleries'

        expect(page).to have_link("Art Museum Manager")
        expect(page).to have_link("Museum")
        expect(page).to have_link("Works")
        expect(page).to have_link("Galleries")
        expect(page).to have_link("Programs")
      end

      it 'navigates to the welcome page' do
        visit '/galleries'

        click_on("Art Museum Manager")

        expect(page).to have_current_path('/')
      end

      it 'navigates to the galleries page' do
        visit '/galleries'

        click_on("Galleries")

        expect(page).to have_current_path('/galleries')
      end

      it 'navigates to the galleries page' do
        visit '/galleries'

        click_on("Galleries")

        expect(page).to have_current_path('/galleries')
      end

      it 'navigates to the programs page' do
        visit '/galleries'

        click_on("Programs")

        expect(page).to have_current_path('/programs')
      end

      it 'navigates to the programs page' do
        visit '/galleries'

        click_on("Programs")

        expect(page).to have_current_path('/programs')
      end
    end
  end
end
