require 'rails_helper'

RSpec.describe 'Mechanics Show' do
    before :each do
        @park = AmusementPark.create!( name: "Politically Incorrect Park", admission_cost: 75 )

        @mechanic_1 = Mechanic.create!( name: "Al", years_experience: 40)
        @mechanic_2 = Mechanic.create!( name: "Dirty Burt", years_experience: 25)
        @mechanic_3 = Mechanic.create!( name: "Spenser", years_experience: 1)

        @ride_1 = Ride.create!( name: "The Death Wish", thrill_rating: 11, open: true, amusement_park_id: @park.id )
        @ride_2 = Ride.create!( name: "Whirling Dervish", thrill_rating: 5, open: true, amusement_park_id: @park.id )
        @ride_3 = Ride.create!( name: "Peregrine Stoop", thrill_rating: 9, open: false, amusement_park_id: @park.id )
        @ride_4 = Ride.create!( name: "Moffet's Tuffet", thrill_rating: 1, open: true, amusement_park_id: @park.id )

        MechanicRide.create!( mechanic_id: @mechanic_1.id, ride_id: @ride_1.id)
        MechanicRide.create!( mechanic_id: @mechanic_1.id, ride_id: @ride_2.id)
        MechanicRide.create!( mechanic_id: @mechanic_1.id, ride_id: @ride_3.id)

        visit "/mechanics/#{@mechanic_1.id}"

    end

    it 'shows name, years of experience, and names of open rides mechanic is working on' do
        expect(page).to have_content(@mechanic_1.name)
        expect(page).to have_content("Years of experience: #{@mechanic_1.years_experience}")
        expect(page).to have_content(@ride_1.name)
        expect(page).to have_content(@ride_2.name)
        #expect(page).to_not have_content(@ride_3.name)
    end

    it 'it lists rides in order of thrillingestness' do   
        expect(@ride_1.name).to appear_before(@ride_3.name)
        expect(@ride_3.name).to appear_before(@ride_2.name)
    end

    it 'can add a ride' do   
        within '#search_section' do
            fill_in 'ride_search', with: "#{@ride_4.id}"
            click_button 'Search for Ride by ID'
        end
      
          click_button 'Add to Mechanic'
      
          expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
          expect(page).to have_content(@ride_4.name)
    end

end