require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/Member.rb' )


get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  @classes = @member.gym_classes
  erb(:"members/show")
end
