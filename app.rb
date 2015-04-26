require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restaurant'
)

require './models/order'
require './models/food'
require './models/party'

get '/' do
  erb :index  #Displays the waitstaff's application
end


# **********FOOD ROUTES**********

get '/api/foods' do #All food items available
  content_type :json
  Food.all.to_json
end

get '/api/foods/:id' do #A single food item and all the parties that included it
  content_type :json
  id = params[:id].to_i
  food = Food.find(id)
  food.to_json
end

post '/api/foods' do #Creates a new food item
  content_type :json
  data = params[:food]
  new_food = Food.create(data)
  new_food.to_json
end

patch '/api/foods/:id' do #Updates a food item
  content_type :json
  id = params[:id].to_i
  data = params[:food]
  food = Food.find(id)
  food.update(data)
  food.to_json
end

put '/api/foods/:id' do #Updates a food item
  content_type :json
  id = params[:id].to_i
  data = params[:food]
  food = Food.find(id)
  food.update(data)
  food.to_json
end

delete '/api/foods/:id' do #Deletes a food item
  content_type :json
  id = params[:id].to_i
  Food.delete(id)
  {message: 'food item deleted'}.to_json
end


# **********PARTY ROUTES**********
get '/api/parties' do #All parties
  content_type :json
  parties = Party.all.to_json
end

get '/api/parties/:id' do #A single party and all the orders it contains
  content_type :json
  id = params[:id].to_i
  party = Party.find(id)
  party.to_json
end

post '/api/parties' do #Creates a new party
  content_type :json
  data = params[:party]
  new_party = Party.create(data)
  new_party.to_json
end

patch '/api/parties/:id' do #Updates a party
  content_type :json
  id = params[:id].to_i
  data = params[:party]
  party = Party.find(id)
  party.update(data)
  party.to_json
end

put '/api/parties/:id' do #Updates a party
  content_type :json
  id = params[:id].to_i
  data = params[:party]
  party = Party.find(id)
  party.update(data)
  party.to_json
end

delete '/api/parties/:id' do #Deletes a party
  content_type :json
  id = params[:id].to_i
  Party.delete(id)
  {message: 'party deleted'}.to_json
end



# ORDER ROUTES
post '/api/orders' do #Creates a new order
  content_type :json
  data = params[:order]
  new_order = Order.create(data)
  new_order.to_json
end

patch '/api/orders/:id' do #Change item to no-charge
  content type :json
  id = params[:id].to_i
  data = params[:order]
  order = Order.find(id)
  order.update(data)
  order.to_json
end

put '/api/orders/:id' do #Change item to no-charge
  content type :json
  id = params[:id].to_i
  data = params[:order]
  order = Order.find(id)
  order.update(data)
  order.to_json
end

delete '/api/orders/:id' do #Removes an order
  content_type :json
  id = params[:id].to_i
  Order.delete(id)
  {message: "order has been deleted"}.to_json
end

get 'api/parties/:id/receipt' do #Saves the party's receipt data to a file.

end

patch 'api/parties/:id/checkout' do #Marks the party as paid

end

patch 'api/parties/:id/checkout' do #Marks the party as paid

end
