require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/bookings_controller')
require_relative('controllers/gym_classes_controller')
require_relative('controllers/members_controller')
also_reload( '../models/*' )

get '/' do
  erb( :index )
end
