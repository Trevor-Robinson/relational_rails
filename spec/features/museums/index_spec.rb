require 'rails_helper'

RSpec.describe 'museums index page', type: :feature do
  it "can see all museum names" do
    museum_1 = Museum.create(name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    museum_2 = Museum.create(name: "Test Museum2", city: "Nowhereville", admission_cost: 15, old_masters: "false", architect: "Nobody")

    visit "/museums"

    expect(page).to have_content(museum_1.name)
    expect(page).to have_content(museum_2.name)
  end

  it "can see and interact with link to create new museum" do
    visit "/museums"
    click_link "New Museum"
    expect(current_path).to eq("/museums/new")
  end
  it "can see and interact with museums index link" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit '/museums'

    click_on 'Museum Index'
    expect(current_path).to eq("/museums")
  end
  it "can see and interact with Artwork index link" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit '/museums'

    click_on 'Artwork Index'
    expect(current_path).to eq("/works")
  end

  it "can see and interact with edit buttons" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit "/museums"

    click_on 'Edit Museum'

    expect(current_path).to eq("/museums/1/edit")
  end

  it "can see and interact with delete buttons" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit "/museums"
    click_on 'Delete Museum'

    expect(current_path).to eq("/museums")
    expect(page).to_not have_content "Test Museum"
  end

end
