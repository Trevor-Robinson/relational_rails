require 'rails_helper'

RSpec.describe 'museums works page', type: :feature do
  it "can see all attributes of each work at a museum" do
    museum_1 = Museum.create(id: 4, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    museum_2 = Museum.create(id: 5, name: "Test Museum2", city: "Nowhereville", admission_cost: 15, old_masters: "false", architect: "Nobody")
    work_1 = Work.create!(id: 10, name: 'Snow II', artist: 'Steven Gontarski', year: 1999, on_display: "false", medium: "Fiberglass and acrylic paint", museum_id: 4)
    work_2 = Work.create!(id: 11, name: 'Nighthawks', artist: 'Edward Hopper', year: 1942, on_display: "true", medium: "Oil on canvas", museum_id: 5)
    work_3 = Work.create!(id: 12, name: 'Still Life', artist: 'Pablo Picasso', year: 1937, on_display: "true", medium: "Oil on canvas", museum_id: 4)
    visit "museums/4/works"

    expect(page).to have_content(work_1.name)
    expect(page).to have_content(work_1.artist)
    expect(page).to have_content(work_1.year)
    expect(page).to have_content(work_1.on_display)
    expect(page).to have_content(work_1.medium)
    expect(page).to_not have_content(work_2.name)
    expect(page).to_not have_content(work_2.artist)
    expect(page).to_not have_content(work_2.year)
    expect(page).to have_content(work_3.name)
    expect(page).to have_content(work_3.artist)
    expect(page).to have_content(work_3.year)
    expect(page).to have_content(work_3.on_display)
    expect(page).to have_content(work_3.medium)
  end

  it "can see and interact with link to create new work" do
    museum_1 = Museum.create(id: 4, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    visit "/museums/4/works"
    click_on "Create New Work"
    expect(current_path).to eq("/museums/4/works/new")
  end

  it 'can see and interact with input to set works more recent than' do
    museum_1 = Museum.create(id: 4, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    work_1 = Work.create!(id: 10, name: 'Snow II', artist: 'Steven Gontarski', year: 1999, on_display: "false", medium: "Fiberglass and acrylic paint", museum_id: 4)
    work_2 = Work.create!(id: 11, name: 'Nighthawks', artist: 'Edward Hopper', year: 1942, on_display: "true", medium: "Oil on canvas", museum_id: 4)
    work_3 = Work.create!(id: 12, name: 'Still Life', artist: 'Pablo Picasso', year: 1937, on_display: "true", medium: "Oil on canvas", museum_id: 4)
    visit "museums/4/works"

    

  end
end
