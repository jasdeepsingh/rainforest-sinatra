require 'json'
require "sinatra/base"
require "sinatra/json"

class RainforestMac < Sinatra::Base
  helpers Sinatra::JSON
  enable :logging
  set :public_folder => "public", :static => true

  get "/index/:api_token" do
    erb :welcome
  end

  get "/status/:api_token", provides: :json do
    content_type('application/json')
    client = RainforestClient.new('cbf89cf421611646e1a88dba851d0d1d')
    json(client.status)
  end

end
