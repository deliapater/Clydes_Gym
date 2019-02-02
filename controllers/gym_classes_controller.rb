require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/GymClass.rb' )

# UPDATE

get '/gym_classes' do
  @gym_class = GymClass.all()
  erb ( :"gym_classes/index" )
end

get '/gym_classes/new' do
  @gym_class = GymClass.all
  erb(:"gym_classes/new")
end

post '/gym_classes' do
  GymClass.new(params).save
  redirect to '/gym_classes'
end

get '/gym_classes/:id' do
  @gym_class = GymClass.find(params['id'].to_i)
  @members = @gym_class.members
  erb(:"gym_classes/show")
end

post '/gym_classes/:id' do
  @gym_class = GymClass.find(params['id'].to_i)
  gym_class = GymClass.new(params)
  gym_class.update
  redirect to "/gym_classes/#{params['id']}"
end

post '/gym_classes/:id/delete' do
  @gym_class = GymClass.find(params['id'].to_i)
  gym_class = GymClass.find(params['id'])
  student.delete
  redirect to '/gym_classes'
end
