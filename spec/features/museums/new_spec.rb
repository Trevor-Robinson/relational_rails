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
end
