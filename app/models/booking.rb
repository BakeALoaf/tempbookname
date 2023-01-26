class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary
  belongs_to :transportation
  belongs_to :accommodation
end
