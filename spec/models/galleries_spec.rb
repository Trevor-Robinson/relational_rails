require 'rails_helper'


RSpec.describe Gallery do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should belong_to :gallery}
  end

  describe 'class methods' do
    it '.event_count' do
      gallery1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      gallery1.events.create!(name: "program1")
      gallery1.events.create!(name: "program2")
      gallery1.events.create!(name: "program3")

      expect(Gallery.event_count).to eq(3)
    end

    it '.sort_alphabetically' do
      program1 = Gallery.create(name: "Painting Gallery", capacity: 30, tech_support: true)
      program1 = gallery1.events.create!(name: "ONE")
      program2 = gallery1.events.create!(name: "TWO")
      program3 = gallery1.events.create!(name: "THREEE")

      expect(Gallery.sort_alphabetically).to eq([program1, program2, program3])
    end
  end


