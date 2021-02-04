require 'rails_helper'

RSpec.describe Gallery do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :capacity}
  end

  describe 'relationships' do
    it {should have_many :programs}
  end

  describe 'instance methods' do
  end
end
