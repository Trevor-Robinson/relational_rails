require 'rails_helper'

describe Museum, type: :model do
  describe 'relationships' do
    it { should have_many :works }
  end
  describe 'instance methods' do
    it 'returns total works' do
      dam = Museum.create!(name: "Denver Art Museum", city: "Denver", admission_cost: 15, old_masters: "false", architect: "Gio Ponti")
      dam.works.create!(name: 'Still Life', artist: 'Pablo Picasso', year: 1937, on_display: "true", medium: "Oil on canvas")
      dam.works.create!(name: 'Willy, Argus, and Lucky', artist: 'Deborah Butterfield', year: 1997, on_display: "true", medium: "Painted and patinated bronze")
      dam.works.create!(name: 'Snow II', artist: 'Steven Gontarski', year: 1999, on_display: "false", medium: "Fiberglass and acrylic paint")

      expect(dam.total_works).to eq(3)
    end
  end
end

# Museum.all.order(created_at: :desc)
