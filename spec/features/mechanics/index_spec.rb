require 'rails_helper'

RSpec.describe 'Mechanics Index' do
    before :each do
        @park = AmusementPark.create!( name: "Politically Incorrect Park", admission_cost: 75 )

        @mechanic_1 = Mechanic.create!( name: "Al", years_experience: 40)
        @mechanic_2 = Mechanic.create!( name: "Dirty Burt", years_experience: 25)
        @mechanic_3 = Mechanic.create!( name: "Spenser", years_experience: 1)

        visit '/mechanics'
    end

    it 'has a header and lists names and xp of all mechanics' do
        expect(page).to have_content("All Mechanics")
        within "#mechanic-#{@mechanic_1.id}" do
            expect(page).to have_content(@mechanic_1.name)
            expect(page).to have_content(@mechanic_1.years_experience)
        end
        within "#mechanic-#{@mechanic_2.id}" do
            expect(page).to have_content(@mechanic_2.name)
            expect(page).to have_content(@mechanic_2.years_experience)          
        end
    end

    it 'shows the avg years xp of all mechanics' do
        expect(page).to have_content("Average Experience: 22.0 years")        
    end

end