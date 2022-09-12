class Mechanic < ApplicationRecord
    has_many :mechanic_rides
    has_many :rides, through: :mechanic_rides

    def self.average_xp
        average(:years_experience)
      end
  end