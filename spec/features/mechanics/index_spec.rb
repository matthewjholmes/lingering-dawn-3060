require 'rails_helper'

RSpec.describe 'mechanic index' do
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

    visit mechanics_path
  end

  it 'i see a header for all mechanics' do
    expect(page).to have_content('All Mechanics')
  end

  it 'i see all mechs names and years' do
    expect(page).to have_content(@mechanic1.name)
    expect(page).to have_content(@mechanic1.years_experience)
    expect(page).to have_content(@mechanic2.name)
    expect(page).to have_content(@mechanic2.years_experience)
    expect(page).to have_content(@mechanic3.name)
    expect(page).to have_content(@mechanic3.years_experience)
  end

  it 'i see average years_experience of all mechs' do
    within('#average') do
      expect(page).to have_content('Average Years of Experience')
      expect(page).to have_content(2)
    end
  end
end
