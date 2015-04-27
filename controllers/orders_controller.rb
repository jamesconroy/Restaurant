class OrdersController < Sinatra::Base

  # ORDER ROUTES

  get '/' do #All orders
    content_type :json
    orders = Order.all
    orders.to_json
  end

  get '/:id' do #
    content_type :json
    id = params[:id]
    order = Order.find(id)
    order.to_json
  end

  post '/' do #Creates a new order
    content_type :json
    data = params[:order]
    new_order = Order.create(data)
    new_order.to_json
  end

  patch '/:id' do #Change item to no-charge
    content_type :json
    id = params[:id].to_i
    data = params[:order]
    order = Order.find(id)
    order.update(data)
    order.to_json
  end

  put '/:id' do #Change item to no-charge
    content_type :json
    id = params[:id].to_i
    data = params[:order]
    order = Order.find(id)
    order.update(data)
    order.to_json
  end

  delete '/:id' do #Removes an order
    content_type :json
    id = params[:id].to_i
    Order.delete(id)
    {message: "order has been deleted"}.to_json
  end

end
