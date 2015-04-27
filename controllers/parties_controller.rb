class PartiesController < Sinatra::Base

  enable  :sessions

  # **********PARTY ROUTES**********
  get '/api/parties' do #All parties
    content_type :json
    parties = Party.all.to_json
  end

  get '/api/parties/:id' do #A single party and all the orders it contains
    content_type :json
    id = params[:id].to_i
    party = Party.find(id)
    partyOrders = party.orders
    partyOrders.to_json
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

  get 'api/parties/:id/receipt' do #Saves the party's receipt data to a file.

  end

  patch 'api/parties/:id/checkout' do #Marks the party as paid

  end

  patch 'api/parties/:id/checkout' do #Marks the party as paid

  end

end
