class Animal < ApplicationRecord
    has_many :sightings
    validates :common_name, :binomial, presence: true
end
