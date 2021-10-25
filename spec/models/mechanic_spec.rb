require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many(:mechanic_rides) }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  describe 'model methods' do
    it 'calcs average years_experience' do
      mechanic1 = Mechanic.create!(name: 'Mechanic 1', years_experience: 1)
      mechanic2 = Mechanic.create!(name: 'Mechanic 2', years_experience: 2)
      mechanic3 = Mechanic.create!(name: 'Mechanic 3', years_experience: 3)

      expect(Mechanic.average_years_experience).to eq(2)
    end
  end
end
