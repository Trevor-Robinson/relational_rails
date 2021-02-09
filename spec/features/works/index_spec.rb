require 'rails_helper'

RSpec.describe 'works index page', type: :feature do
  it "can see all on display work names" do
    museum_1 = Museum.create(id: 4, name: "Test Museum", city: "Nowhere", admission_cost: 15, old_masters: "false", architect: "No One")
    museum_2 = Museum.create(id: 5, name: "Test Museum2", city: "Nowhereville", admission_cost: 15, old_masters: "false", architect: "Nobody")
    work_1 = Work.create!(id: 10, name: 'Snow II', artist: 'Steven Gontarski', year: 1999, on_display: "false", medium: "Fiberglass and acrylic paint", museum_id: 4)
    work_2 = Work.create!(id: 11, name: 'Nighthawks', artist: 'Edward Hopper', year: 1942, on_display: "true", medium: "Oil on canvas", museum_id: 5)
    visit "/works"

    expect(page).to_not have_content(work_1.name)
    expect(page).to have_content(work_2.name)
  end

end
