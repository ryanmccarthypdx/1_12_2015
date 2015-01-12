require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/parcels.rb')


get('/') do
  erb(:parcel_form)
end

get('/parcel_result') do
  @weight = params.fetch('weight').to_f()
  @length = params.fetch('length').to_f()
  @width = params.fetch('width').to_f()
  @height = params.fetch('height').to_f()
  new_parcel = Parcel.new(@length, @width, @height, @weight)
  @parcel_volume = new_parcel.volume()
  @parcel_cost = new_parcel.cost_to_ship()
  erb(:parcel_result)
end
