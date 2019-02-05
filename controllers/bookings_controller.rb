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

get '/bookings/new_member' do
  @gym_classes = GymClass.all
  @members = Member.all
  erb(:"bookings/new_member")
end

post '/bookings/new_member' do
  booking = Booking.new(params)
  booking.save
  redirect to '/bookings/new_member/new_class'
end

get '/bookings/new_member/new_class' do
  @member = Member.find(params["member_id"])
  @gym_classes = GymClass.all
  erb(:"bookings/new_class")
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to '/bookings/new_member/new_class'
end

post '/bookings' do
  booking = Booking.new(params)
  booking.save
  redirect to '/bookings'
end
