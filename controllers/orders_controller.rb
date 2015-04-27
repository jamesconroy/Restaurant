class

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

end
