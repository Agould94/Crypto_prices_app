require 'net/http'
require 'open-uri'
require 'json'

class GetPrograms
    URLM = "https://api.nomics.com/v1/markets?key=421c2246c0e25e7aad14db3397041634"
    URLC = "https://api.nomics.com/v1/currencies/ticker?key=421c2246c0e25e7aad14db3397041634&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&per-page=100&page=1"

    def initialize
       @currency_programs = self.get_programs_for_currencies 
    end
    def get_programs_for_markets
        uri = URI.parse(URLM)
        response = Net::HTTP.get_response(uri)
        response.body
    end
    def get_programs_for_currencies
        uri = URI.parse(URLC)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parsed_currencies
        JSON.parse(@currency_programs)
    end


end
currency_programs = GetPrograms.new.get_programs_for_currencies
market_programs = GetPrograms.new.get_programs_for_markets

parsed_currencies = JSON.parse(currency_programs)
