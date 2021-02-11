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
    fill_in "greater_than", with: "1960"
    click_on 'Submit'
    expect(page).to have_content(museum_1.name)
    expect(page).to_not have_content(work_2.name)
    expect(page).to_not have_content(work_3.name)
  end

  it "can see and interact with museums index link" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit 'museums/1/works'

    click_on 'Museum Index'
    expect(current_path).to eq("/museums")
  end
  it "can see and interact with Artwork index link" do
    museum_1 = Museum.create(id: 1, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")

    visit 'museums/1/works'

    click_on 'Artwork Index'
    expect(current_path).to eq("/works")
  end

  it "can see and interact with edit button" do
    museum_1 = Museum.create(id: 4, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    work_1 = museum_1.works.create!(id: 10, name: 'Snow II', artist: 'Steven Gontarski', year: 1999, on_display: "true", medium: "Fiberglass and acrylic paint")

    visit '/museums/4/works'

    click_on 'Edit Work'

    expect(current_path).to eq("/works/10/edit")
  end

  it "can see and interact with delete button" do
    museum_1 = Museum.create(id: 4, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    work_1 = museum_1.works.create!(id: 10, name: 'Snow III', artist: 'Steven Gontarski', year: 1999, on_display: "true", medium: "Fiberglass and acrylic paint")

    visit '/museums/4/works'

    click_on 'Delete Work'

    expect(current_path).to eq("/works")
    expect(page).to_not have_content "Snow III"
  end
end
