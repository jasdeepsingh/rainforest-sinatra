require_relative "spec_helper"
require_relative "../rainforest_mac.rb"

def app
  RainforestMac
end

describe RainforestMac do
  it "responds with a welcome message" do
    get '/'

    last_response.body.must_include 'Welcome to the Sinatra Template!'
  end
end
