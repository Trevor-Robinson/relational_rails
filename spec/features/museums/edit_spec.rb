require 'rails_helper'

RSpec.describe 'museums edit page', type: :feature do
  it "can fill out and submit an edit to a museum" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit 'museums/1/edit'

    expect(page).to have_content("Museum name:")
    expect(page).to have_content("City:")
    expect(page).to have_content("Admission Cost:")
    expect(page).to have_content("Works by old masters:")
    expect(page).to have_content("Architect:")

    fill_in "museum[name]", with: "Different Museum"
    fill_in "museum[city]", with: "Somewhere"
    fill_in "museum[admission_cost]", with: 23
    choose "yes"
    fill_in "museum[architect]", with: "Somebody"

    click_on 'Submit'

    expect(current_path).to eq("/museums/1")
    expect(page).to have_content("Different Museum")
    expect(page).to have_content("Somewhere")
    expect(page).to have_content("Somebody")
    expect(page).to have_content("true")
    expect(page).to have_content(23)
  end
end
