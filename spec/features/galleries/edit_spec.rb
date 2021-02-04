require 'rails_helper'

describe 'As a visitor' do
  describe 'when I am on the galleries program page' do
    it 'I can update its information' do
      sculpture_gallery = Gallery.create(name: "Sculpture Gallery", capacity: 25, tech_support: false)

      visit "/galleries/#{sculpture_gallery.id}"

      click_link "Update Gallery"
      expect(current_path).to eq("/galleries/#{sculpture_gallery.id}/edit")

      fill_in 'Name', with: 'Abstract Paintings'
      fill_in 'Capacity', with: 12

      click_on 'Submit'
      expect(current_path).to eq("/galleries/#{sculpture_gallery.id}")
      expect(page).to have_content("Abstract Paintings")
    end
  end
end

# User Story 3, Parent Creation (x2)
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
