require 'rails_helper'

RSpec.describe 'works show page', type: :feature do
  it "can see all attributes for a work" do
    museum_1 = Museum.create(id: 4, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    work_1 = Work.create!(id: 10, name: 'Snow II', artist: 'Steven Gontarski', year: 1999, on_display: "false", medium: "Fiberglass and acrylic paint", museum_id: 4)

    visit '/works/10'

    expect(page).to have_content(work_1.name)
    expect(page).to have_content(work_1.artist)
    expect(page).to have_content(work_1.year)
    expect(page).to have_content(work_1.on_display)
    expect(page).to have_content(work_1.medium)
  end

  it "can see and interact with edit button" do
    museum_1 = Museum.create(id: 4, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    work_1 = Work.create!(id: 10, name: 'Snow II', artist: 'Steven Gontarski', year: 1999, on_display: "false", medium: "Fiberglass and acrylic paint", museum_id: 4)

    visit '/works/10'

    click_on 'Edit'

    expect(current_path).to eq("/works/10/edit")
  end

  it "can see and interact with delete button" do
    museum_1 = Museum.create(id: 4, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    work_1 = Work.create!(id: 10, name: 'Snow III', artist: 'Steven Gontarski', year: 1999, on_display: "false", medium: "Fiberglass and acrylic paint", museum_id: 4)

    visit '/works/10'

    click_on 'delete'

    expect(current_path).to eq("/works")
    expect(page).to_not have_content "Snow III"
  end
  it "can see and interact with museums index link" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    work_1 = museum_1.works.create!(id: 10, name: 'Snow III', artist: 'Steven Gontarski', year: 1999, on_display: "true", medium: "Fiberglass and acrylic paint")

    visit '/works/10'

    click_on 'Museum Index'
    expect(current_path).to eq("/museums")
  end
  it "can see and interact with Artwork index link" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    work_1 = museum_1.works.create!(id: 10, name: 'Snow III', artist: 'Steven Gontarski', year: 1999, on_display: "true", medium: "Fiberglass and acrylic paint")

    visit '/works/10'

    click_on 'Artwork Index'
    expect(current_path).to eq("/works")
  end
end
