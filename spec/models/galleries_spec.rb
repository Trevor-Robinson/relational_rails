require 'rails_helper'

RSpec.describe Gallery do
    describe 'relationships' do
      it { should have_many :programs }
    end
  end 
