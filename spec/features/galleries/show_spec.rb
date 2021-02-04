require 'rails_helper'

describe 'As a visitor' do
  describe 'When i visit /galleries/:id' do
    it 'I see the gallery with that id including the galleries attributes:' do
      sculpture_gallery = Gallery.create(name: "Sculpture Gallery", capacity: 25, tech_support: true)
      abstract_painting = Gallery.create(name: "Abstract Paintings", capacity: 10, tech_support: false)

      visit "/galleries/#{sculpture_gallery.id}"
      expect(page).to have_content(sculpture_gallery.name)
      expect(page).to have_content(sculpture_gallery.capacity)
      expect(page).to have_content(sculpture_gallery.tech_support)
      expect(page).to_not have_content(abstract_painting.name)
    end
  end
end
