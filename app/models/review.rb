class Review < ApplicationRecord
  belongs_to :itinerary
  belongs_to :transportation
  belongs_to :accommodation
end
