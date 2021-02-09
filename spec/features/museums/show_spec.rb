require 'rails_helper'

RSpec.describe 'museums show page', type: :feature do
  it "can see all attributes for a museum" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit "/museums/1"

    expect(page).to have_content(museum_1.name)
    expect(page).to have_content(museum_1.city)
    expect(page).to have_content(museum_1.admission_cost)
    expect(page).to have_content(museum_1.old_masters)
    expect(page).to have_content(museum_1.architect)
    expect(page).to have_content(museum_1.total_works)
  end

  it "can see and interact with edit button" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit "/museums/1"

    click_on 'Edit'

    expect(current_path).to eq("/museums/1/edit")
  end

  it "can see and interact with delete button" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit "/museums/1"

    click_on 'delete'

    expect(current_path).to eq("/museums")
    expect(page).to_not have_content "Test Museum"
  end

end
