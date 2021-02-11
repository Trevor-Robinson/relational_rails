require 'rails_helper'

RSpec.describe Program do
    describe 'relationships' do
      it { should belong_to :gallery }
    end
  end
