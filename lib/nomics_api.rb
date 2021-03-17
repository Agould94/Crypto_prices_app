require 'net/http'
require 'open-uri'
require 'json'
require 'pry'

class GetPrograms
    URLM = "https://api.nomics.com/v1/markets?key=421c2246c0e25e7aad14db3397041634"
    URLC = "https://api.nomics.com/v1/currencies/ticker?key=421c2246c0e25e7aad14db3397041634&ids=BTC,ETH,XRP&interval=1d,30d&convert=EUR&per-page=100&page=1"


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
end

market_programs = GetPrograms.new.get_programs_for_markets
currency_programs = GetPrograms.new.get_programs_for_currencies

parsed = JSON.parse(currency_programs)

def currency_ids(input)
    input.each do |currency|
        puts currency["id"]
    end
end

def currency_names(input)
    input.each do |currency|
        puts currency["name"]
    end
end

puts currency_ids(parsed)

#binding.pry
#p parsed[][][]