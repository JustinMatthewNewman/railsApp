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
    #puts @response_obj2[1]
    
    @name1
    @price1
    @hour1
    @day1
    @month1
    @array = Array.new(100) 

    for index in (1...100)
      begin
        @name1 = @response_obj2[index]["name"]
      rescue
        @ame1 = "Unknown"
      end

      begin
        @price1 =  @response_obj2[index]["price_usd"]
      rescue
        @price1 = "Unknown"
      end

      begin
        @hour1 = @response_obj2[index]["volume_1hrs_usd"]
      rescue
        @hour1 = "Unknown"
      end

      begin
        @day1 = @response_obj2[index]["volume_1day_usd"]
      rescue
        @day1 = "Unknown"
      end

      begin
        @month1 = @response_obj2[index]["volume_1mth_usd"]
      rescue
        @month1 = "Unknown"
      end

      
      coinObj1 = CoinsObj.new(@name1,@price1,@hour1,@day1,@month1)
      @array[index] = coinObj1
      
    end
    #puts @array.inspect



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
  
  class CoinsObj

    attr_accessor :name, :priceusd, :hour, :day, :month

    def initialize(name, priceusd, hour, day, month)
        @name = name
        @priceusd = priceusd
        @hour = hour
        @day = day
        @month = month
    end
  end
end

