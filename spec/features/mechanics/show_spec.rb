require 'rails_helper'

RSpec.describe 'Mechanics Show' do
    before :each do
        @park = AmusementPark.create!( name: "Politically Incorrect Park", admission_cost: 75 )

        @mechanic_1 = Mechanic.create!( name: "Al", years_experience: 40)
        @mechanic_2 = Mechanic.create!( name: "Dirty Burt", years_experience: 25)
        @mechanic_3 = Mechanic.create!( name: "Spenser", years_experience: 1)

        @ride_1 = Ride.create!( name: "The Death Wish", thrill_rating: 11, open: false, amusement_park_id: @park.id )
        # @ride_2 = Ride.create!( name: "Whirling Dervish", thrill_rating: 5, open: false, amusement_park_id: @park.id )

        MechanicRide.create!( mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
        # MechanicRide.create!( mechanic_id: @mechanic_3.id, ride_id: @ride_1.id)

        visit "/mechanics/#{@mechanic_1.id}"

    end

    it 'shows name, years of experience, and names of open rides mechanic is working on' do
        expect(page).to have_content(@mechanic_1.name)
        expect(page).to have_content("Years of experience: #{@mechanic_1.years_experience}")
        expect(page).to_not have_content(@ride_1.name)
    end

    xit 'it lists rides in descending thrill order' do   
    end

end