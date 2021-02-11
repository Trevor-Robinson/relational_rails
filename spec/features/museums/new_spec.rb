require 'rails_helper'

RSpec.describe 'museums new page', type: :feature do
  it "can fill out and submit a new museum" do
    visit "/museums/new"

    fill_in "museum[name]", with: "Test Museum"
    fill_in "museum[city]", with: "Nowhere"
    fill_in "museum[admission_cost]", with: 15
    fill_in "museum[architect]", with: "No one"

    click_on 'Submit'

    expect(current_path).to eq("/museums")
    expect(page).to have_content("Test Museum")
  end

  it "can see and interact with museums index link" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit 'museums/new'

    click_on 'Museum Index'
    expect(current_path).to eq("/museums")
  end
  it "can see and interact with Artwork index link" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit 'museums/new'

    click_on 'Artwork Index'
    expect(current_path).to eq("/works")
  end
end
