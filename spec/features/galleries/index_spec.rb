require 'rails_helper'

describe 'As a visitor' do
  describe 'When i visit /galleries' do
    it 'I click a link to add a "New gallery"' do

      visit "/galleries"
      click_link "New Gallery"
      expect(current_path).to eq("/galleries/new")

      fill_in 'Name', with: 'Sculpture Gallery'
      fill_in 'Capacity', with: 25
      check 'tech_support'

      click_on 'Submit'

      expect(current_path).to eq("/galleries")
      expect(page).to have_content("Sculpture Gallery")

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
