require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )
require_relative( '../models/Booking' )
require_relative( '../models/GymClass.rb' )
require_relative( '../models/Member.rb' )
also_reload( '../models/*' )

get '/bookings' do
  @bookings = Booking.all
  @members = Member.all
  erb ( :"bookings/index" )
end

get '/bookings/new' do
  @gym_classes = GymClass.all
  @members = Member.all
  erb(:"bookings/new")
end

post '/bookings/new' do
  booking = Booking.new(params[:id])
  booking.save
  redirect to '/bookings'
end
