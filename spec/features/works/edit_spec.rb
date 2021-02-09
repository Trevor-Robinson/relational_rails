require 'rails_helper'

RSpec.describe 'works edit page', type: :feature do
  it "can fill out and submit an edit to a work" do
    museum_1 = Museum.create(id: 5, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    work_1 = Work.create!(id: 10, name: 'Snow II', artist: 'Steven Gontarski', year: 1999, on_display: "false", medium: "Fiberglass and acrylic paint", museum_id: 5)

    visit 'works/10/edit'

    expect(page).to have_content("work name:")
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

    expect(current_path).to eq("/works/10")
    expect(page).to have_content("No III")
    expect(page).to have_content("Me")
    expect(page).to have_content("Crayon")
    expect(page).to have_content("true")
    expect(page).to have_content(2020)
  end
end
