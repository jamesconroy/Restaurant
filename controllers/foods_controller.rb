class FoodsController < Sinatra::Base

  enable  :sessions
  # helpers Sinatra::SessionHelper

  get '/' do #All food items available
    content_type :json
    foods = Food.all
    foods.to_json
  end

  get '/:id' do #A single food item and all the parties that included it
    content_type :json
    id = params[:id].to_i
    food = Food.find(id)
    food.to_json
  end

  post '/' do #Creates a new food item
    content_type :json
    data = params[:food]
    new_food = Food.create(data)
    new_food.to_json
  end

  patch '/:id' do #Updates a food item
    content_type :json
    id = params[:id].to_i
    data = params[:food]
    food = Food.find(id)
    food.update(data)
    food.to_json
  end

  put '/:id' do #Updates a food item
    content_type :json
    id = params[:id].to_i
    data = params[:food]
    food = Food.find(id)
    food.update(data)
    food.to_json
  end

  delete '/:id' do #Deletes a food item
    content_type :json
    id = params[:id].to_i
    Food.delete(id)
    {message: 'food item deleted'}.to_json
  end
end
