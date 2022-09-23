class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'
    url = "https://api.exchangerate.host/latest"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @response_obj = JSON.parse(response)

    require 'uri'

    url2 = URI("https://rest.coinapi.io/v1/assets")
    http2 = Net::HTTP.new(url2.host, url2.port)
    http2.use_ssl = true
    request2 = Net::HTTP::Get.new(url2)
    request2["X-CoinAPI-Key"] = '8FEEE8BE-B955-4B90-9BBA-31190CEC9875'
    response2 = http2.request(request2)
    @response_obj2 = JSON.parse(response2.body)

    url3 = URI("https://rest.coinapi.io/v1/assets/icons/100")
    http3 = Net::HTTP.new(url3.host, url3.port)
    http3.use_ssl = true
    request3 = Net::HTTP::Get.new(url3)
    request3["X-CoinAPI-Key"] = '8FEEE8BE-B955-4B90-9BBA-31190CEC9875'
    response3 = http3.request(request3)
    @response_obj3 = JSON.parse(response3.body)

  

  end

  def about 
  end

  def bitcoin
  end

  def signup
  end
  
end
