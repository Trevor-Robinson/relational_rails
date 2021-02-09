require 'rails_helper'

RSpec.describe 'works new page', type: :feature do
  it "can fill out and submit a new work" do
    museum_1 = Museum.create(id: 4, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    visit "/museums/4/works/new"

    expect(page).to have_content("Name of Work:")
    expect(page).to have_content("Artist:")
    expect(page).to have_content("Year Created:")
    expect(page).to have_content("On Display:")
    expect(page).to have_content("Medium:")

    fill_in "work[name]", with: "No III"
    fill_in "work[artist]", with: "Me"
    fill_in "work[year]", with: 2020
    choose "yes"
    fill_in "work[medium]", with: "Crayon"

    click_on 'Submit'

    expect(current_path).to eq("/museums/4/works")
    expect(page).to have_content("No III")
    expect(page).to have_content("Me")
    expect(page).to have_content("Crayon")
    expect(page).to have_content("true")
    expect(page).to have_content(2020)
  end
end
