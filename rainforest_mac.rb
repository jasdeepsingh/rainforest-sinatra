require 'json'
require "sinatra/base"
require "sinatra/json"

class RainforestMac < Sinatra::Base
  helpers Sinatra::JSON
  enable :logging
  set :public_folder => "public", :static => true

  # index route
  before '/index/:api_token' do
    throw_unauthorized
  end

  get "/index/:api_token" do
    @api_token = params[:api_token]
    erb :welcome
  end


  # status proxy route
  before '/status/:api_token' do
    throw_unauthorized
  end

  get "/status/:api_token", provides: :json do
    content_type('application/json')
    client = RainforestClient.new(params[:api_token])
    json(client.status)
  end

  def throw_unauthorized
    halt 401, 'unauthorized' unless params[:api_token]
  end

end
