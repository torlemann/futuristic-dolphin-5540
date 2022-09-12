require 'rails_helper'

RSpec.describe 'Mechanics Index' do
    before :each do
        @park = AmusementPark.create! ( name: "Politically Incorrect Park", admission_cost: 75 )

        @mechanic_1 = Mechanic.create!( name: "Al", years_of_experience: 40)
        @mechanic_2 = Mechanic.create!( name: "Dirty Burt", years_of_experience: 25)
        @mechanic_3 = Mechanic.create!( name: "Spenser", years_of_experience: 1.5)

        # @ride_1 = Ride.create!( name: "The Death Wish", thrill_rating: 11, open: false, amusement_park_id: @park.id )
        # @ride_2 = Ride.create!( name: "Whirling Dervish", thrill_rating: 5, open: false, amusement_park_id: @park.id )

        # MechanicRide.create!( mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
        # MechanicRide.create!( mechanic_id: @mechanic_3.id, ride_id: @ride_1.id)

        #visit "/mechanics/#{@mechanic_1.id}"

        visit '/mechanics'
    end

    it 'lists names and xp of all mechanics' do
        within "#mechanic-#{@mechanic_1.id}" do
            expect(page).to have_content(@mechanic_1.name)
            expect(page).to have_content(@mechanic_1.years_of_experience)
        end
        within "#mechanic-#{@mechanic_2.id}" do
            expect(page).to have_content(@mechanic_2.name)
            expect(page).to have_content(@mechanic_2.years_of_experience)          
        end
    end

    it 'shows the avg years xp of all mechanics' do
        expect(page).to have_content("Average Experience: 22.16 years")          
    end

end