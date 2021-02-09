require 'rails_helper'

describe Work, type: :model do
  describe 'relationships' do
    it { should belong_to :museum }
  end
  describe 'instance methods' do
    it 'can return only true' do
      dam = Museum.create!(name: "Denver Art Museum", city: "Denver", admission_cost: 15, old_masters: "false", architect: "Gio Ponti")
      dam.works.create!(name: 'Still Life', artist: 'Pablo Picasso', year: 1937, on_display: "true", medium: "Oil on canvas")
      dam.works.create!(name: 'Willy, Argus, and Lucky', artist: 'Deborah Butterfield', year: 1997, on_display: "true", medium: "Painted and patinated bronze")
      dam.works.create!(name: 'Snow II', artist: 'Steven Gontarski', year: 1999, on_display: "false", medium: "Fiberglass and acrylic paint")
      expect(dam.works.display_true.count).to eq(2)
    end
  end
end
