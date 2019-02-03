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

post '/bookings' do
  Member.new(params).save
  @members = Member.all
  @bookings = Booking.all
  booking = Booking.new(params)
  booking.save
  booking.update
  member = Member.new(params)
  member.save
  booking.update
  redirect to("/bookings/#{params['id']}")
end

get '/bookings/edit' do
  @gym_classes = GymClass.all
  @members = Member.all
  gym_class = GymClass.find(params['id'].to_i)
  gym_class.update
  erb(:"bookings/edit")
end
