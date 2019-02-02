require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/Booking' )
require_relative( '../models/GymClass.rb' )
require_relative( '../models/Member.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all
  erb ( :"bookings/index" )
end

get '/bookings/edit' do
  @gym_classes = GymClass.all
  @members = Member.all
  erb(:"bookings/edit")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to("/bookings")
end
