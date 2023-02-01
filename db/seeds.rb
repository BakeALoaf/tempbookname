# db/seeds.rb

# First, clear any existing data in the database
puts "Clearing existing data..."
Accommodation.destroy_all
Transportation.destroy_all
Booking.destroy_all
Itinerary.destroy_all
User.destroy_all

# Create some sample users
puts "Creating sample users..."
users = [
  { name: "Ian", email: "Ian@example.com", password: "password" },
  { name: "Arbi", email: "Arbi@example.com", password: "password" }
]

User.create!(users)

# Create some sample accommodations
puts "Creating sample accommodations..."
accommodations = [
  { name: "Marriott", location: "New York", price: 200, user_id: User.first.id },
  { name: "Hilton", location: "London", price: 150, user_id: User.last.id }
]

Accommodation.create!(accommodations)

# Create some sample transportations
puts "Creating sample transportations..."
transportations = [
  { name: "Delta", departure_location: "New York", arrival_location: "London", departure_time: Date.today + 1.month, arrival_time: Date.today + 2.month + 5.hours, price: 500, user_id: User.first.id },
  { name: "British Airways", departure_location: "London", arrival_location: "New York", departure_time: Date.today + 2.month, arrival_time: Date.today + 3.month + 7.hours, price: 400, user_id: User.last.id }
]

Transportation.create!(transportations)

# Create some sample itineraries
puts "Creating sample itineraries..."
itineraries = [
  { user_id: User.first.id, departure_date: Date.today + 2.month },
  { user_id: User.last.id, departure_date: Date.today + 3.month }
]

Itinerary.create!(itineraries)

# Create some sample bookings
puts "Creating sample bookings..."
bookings = [
  { user_id: User.first.id, accommodation_id: Accommodation.first.id, transportation_id: Transportation.first.id, itinerary_id: Itinerary.first.id },
  { user_id: User.last.id, accommodation_id: Accommodation.last.id, transportation_id: Transportation.last.id, itinerary_id: Itinerary.last.id }
]

Booking.create!(bookings)

puts "Seed data complete!"
