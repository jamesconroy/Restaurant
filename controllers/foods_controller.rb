class FoodsController < Sinatra::Base
  enable  :sessions
  helpers Sinatra::SessionHelper

  # HELPERS
  def food_params
    return params[:food] if params[:food]
      body_data = {}
      @request_body ||=request_body.read.to_s
      body_data = (JSON(@request_body)) unless @request_body.empty?
      body_data = body_data['food'] || body_data
    end
  end

  # DEBUGGING
  get '/pry' do
    binding.pry
  end

  # ROUTES
  get '/' do #All food items available
    content_type :json
    foods = Food.all
    foods.to_json
  end

  get '/:id' do #A single food item and all the parties that included it
    content_type :json
    food = Food.find(params[:id])
    food.to_json
  end

  post '/' do #Creates a new food item
    authenticate_api!
    new_food = Food.create(food_params)
    content_type :json
    new_food.to_json
  end

  patch '/:id' do #Updates a food item
    authenticate_api!
    food = Food.find(params[:id])
    food.update(food_params)
    content_type :json
    food.to_json
  end

  put '/:id' do #Updates a food item
    authenticate_api!
    food = Food.find(params[:food])
    food.update(food_params)
    content_type :json
    food.to_json
  end

  delete '/:id' do #Deletes a food item
    authenticate_api!
    Food.destroy(params[:id])
    content_type :json
    {message: 'food item deleted'}.to_json
  end
end
