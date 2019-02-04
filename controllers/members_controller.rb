require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/Member.rb' )


get '/members' do
  @members = Member.all()
  erb ( :"members/index" )
end

get '/members/new' do
  @gym_class = GymClass.all
  erb(:"members/new")
end

post '/members' do
  Member.new(params).save
  redirect to '/members'
end

get '/members/:id' do
  @member = Member.find(params['id'].to_i)
  @classes = @member.gym_classes
  erb(:"members/show")
end

get '/members/:id/edit' do
  @gym_class = GymClass.all
  @member = Member.find(params['id'])
  erb(:"members/edit")
end

post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to "/members/#{params['id']}"
end


post '/members/:id/update' do
  @member = Member.find(params['id'].to_i)
  member = Member.new(params)
  member.update
  redirect to "/members/#{params['id']}"
end
