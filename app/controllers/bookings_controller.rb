class BookingsController < ApplicationController
  require 'uri'
  require 'net/http'
  require 'openssl'

  def index
    @user = current_user
    @bookings = Booking.where(user_id: @user)
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new

    url = URI("https://skyscanner50.p.rapidapi.com/api/v1/searchFlights?origin=LOND&destination=NYCA&date=%3CREQUIRED%3E&adults=1&currency=USD&countryCode=US&market=en-US")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = 'c2c95fa4d1mshbce08ebcc8b6ab0p197b68jsn270eb18d8709'
    request["X-RapidAPI-Host"] = 'skyscanner50.p.rapidapi.com'

    response = http.request(request)
    variable = response.read_body
    post = JSON.parse
    booking = post['data']

    Booking.create!(departure: booking['legs'][0]['departure'])
  end
end
