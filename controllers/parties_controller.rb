class PartiesController < Sinatra::Base
  enable  :sessions

  # HELPERS
  def party_params
    return params[:party] if params[:party]
    body_data = {}
    @request_body ||= request.body.read.to_s
    body_data = body_data['party'] || body_data
  end

  # DEBUGGING
  get '/pry' do
    binding.pry
  end

  # **********PARTY ROUTES**********
  get '/' do
    parties = Party.all
    content_type :json
    parties.to_json(include: :foods)
  end

  get '/:id' do
    party = Party.find(params[:id])
    content_type :json
    party.to_json
  end

  post '/' do
    new_party = Party.create(party_params)
    content_type :json
    new_party.to_json(include: :foods)
  end

  patch '/:id' do
    party = Party.find(params[:id])
    party.update(partyparams)
    content_type :json
    party.to_json(include: :foods)
  end

  put '/:id' do
    party = Party.find(params[:id])
    party.update(party_params)
    content_type :json
    party.to_json(include: :foods)
  end

  delete '/:id' do
    Party.destroy(params[:id])
    content_type :json
    {message: 'party deleted'}.to_json
  end

end
