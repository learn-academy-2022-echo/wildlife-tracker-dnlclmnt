class Sighting < ApplicationRecord
    belongs_to :animal
    validates :animal_id, :latitude, :longitude, :date, presence: true
end
