require 'rails_helper'

RSpec.describe Ride, type: :model do
  before :each do
    @park = AmusementPark.create!( name: "Politically Incorrect Park", admission_cost: 75 )
    @ride_1 = Ride.create!( name: "The Death Wish", thrill_rating: 11, open: true, amusement_park_id: @park.id )
    @ride_2 = Ride.create!( name: "Whirling Dervish", thrill_rating: 5, open: true, amusement_park_id: @park.id )
    @ride_3 = Ride.create!( name: "Peregrine Stoop", thrill_rating: 9, open: false, amusement_park_id: @park.id )

  end

  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many :mechanic_rides }
    it { should have_many(:mechanics).through(:mechanic_rides) }
  end

end