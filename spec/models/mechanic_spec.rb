require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :mechanic_rides }
    it { should have_many(:rides).through(:mechanic_rides) }
  end

  it 'can calculate the average xp of mechanics' do
    @mechanic_1 = Mechanic.create!( name: "Al", years_experience: 40)
    @mechanic_2 = Mechanic.create!( name: "Dirty Burt", years_experience: 25)
    
    expect(Mechanic.average_xp).to eq(32.5)
  end
end