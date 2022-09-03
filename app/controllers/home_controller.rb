class HomeController < ApplicationController
  def index
    require 'net/http'
require 'json'

url = "https://api.exchangerate.host/latest"
uri = URI(url)
response = Net::HTTP.get(uri)
@response_obj = JSON.parse(response)

  end

  def about 
  end
end
