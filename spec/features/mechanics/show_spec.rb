require 'rails_helper'

RSpec.describe 'mechanic show page' do
  describe 'when i visit a mechanic show page' do
    before do
      @park = AmusementPark.create!(name: 'Park 1', cost_of_admission: 50)
      @ride1 = @park.rides.create!(name: 'Ride 1', thrill_rating: 1, open: true)
      @ride2 = @park.rides.create!(name: 'Ride 2', thrill_rating: 2, open: true)
      @ride3 = @park.rides.create!(name: 'Ride 3', thrill_rating: 3, open: false)
      @ride4 = @park.rides.create!(name: 'Ride 4', thrill_rating: 4, open: true)
      @mechanic = Mechanic.create!(name: 'Mechanic 1', years_experience: 1)
      @mechanic_ride1 = MechanicRide.create!(mechanic_id: @mechanic.id, ride_id: @ride1.id)
      @mechanic_ride2 = MechanicRide.create!(mechanic_id: @mechanic.id, ride_id: @ride2.id)
      @mechanic_ride3 = MechanicRide.create!(mechanic_id: @mechanic.id, ride_id: @ride3.id)

      visit mechanic_path(@mechanic)
    end

    it 'i see their name, experience, and rides' do
      expect(page).to have_content(@mechanic.name)
      expect(page).to have_content(@mechanic.years_experience)
      expect(page).to have_content(@ride1.name)
      expect(page).to have_content(@ride2.name)
    end

    it 'i only see open rides' do
      expect(page).to_not have_content(@ride3.name)
    end

    it 'rides are listed by rating descending' do
      expect(@ride2.name).to appear_before(@ride1.name)
    end

    context 'i see a form to add a ride to mech' do
      it 'has form title' do
        expect(page).to have_content("Add a ride to this mechanic's workload")
      end

      it 'i fill out form with new ride id, submit, and am redirected back to mech show page with new ride listed' do
        fill_in :ride_id, with: @ride4.id
        click_button 'Add Ride'

        expect(current_path).to eq(mechanic_path(@mechanic))
        expect(page).to have_content(@ride4.name)
      end
    end
  end
end
