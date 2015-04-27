class FoodsController < Sinatra::Base

  enable  :sessions
  helpers Sinatra::SessionHelper

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
end
