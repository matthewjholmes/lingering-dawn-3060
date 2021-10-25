require 'rails_helper'

RSpec.describe 'amusement_park show page' do
  before do
    @park = AmusementPark.create!(name: 'Park 1', cost_of_admission: 50)
    @ride1 = @park.rides.create!(name: 'Ride B', thrill_rating: 1, open: true)
    @ride2 = @park.rides.create!(name: 'Ride A', thrill_rating: 2, open: true)
    @ride3 = @park.rides.create!(name: 'Ride C', thrill_rating: 3, open: false)

    visit amusement_park_path(@park)
  end

  it 'i see the name and price of admission' do
    expect(page).to have_content(@park.name)
    expect(page).to have_content(@park.cost_of_admission)
  end

  it 'i see all rides listed in alphabetical order' do
    expect(@ride2.name).to appear_before(@ride1.name)
    expect(@ride1.name).to appear_before(@ride3.name)
  end

  it 'i see average thrill rating' do
    expect(page).to have_content('Average Thrill Rating: 2')
  end
end
