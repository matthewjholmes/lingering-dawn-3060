require 'rails_helper'

RSpec.describe Ride do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanic_rides) }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

  describe 'model methods' do
    before do
      @park = AmusementPark.create!(name: 'Park 1', cost_of_admission: 50)
      @ride1 = @park.rides.create!(name: 'Ride 1', thrill_rating: 1, open: true)
      @ride2 = @park.rides.create!(name: 'Ride 2', thrill_rating: 2, open: true)
      @ride3 = @park.rides.create!(name: 'Ride 3', thrill_rating: 3, open: false)
      @mechanic1 = Mechanic.create!(name: 'Mechanic 1', years_experience: 1)
      @mechanic2 = Mechanic.create!(name: 'Mechanic 2', years_experience: 2)
      @mechanic3 = Mechanic.create!(name: 'Mechanic 3', years_experience: 3)
      @mechanic_ride1 = MechanicRide.create!(mechanic_id: @mechanic1.id, ride_id: @ride1.id)
      @mechanic_ride2 = MechanicRide.create!(mechanic_id: @mechanic2.id, ride_id: @ride2.id)
      @mechanic_ride3 = MechanicRide.create!(mechanic_id: @mechanic3.id, ride_id: @ride3.id)
    end

    it 'orders rides by thrill rating descending' do
      expect(Ride.order_by_rating_descending).to eq([@ride3, @ride2, @ride1])
    end
  end
end
