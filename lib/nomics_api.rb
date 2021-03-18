require 'net/http'
require 'open-uri'
require 'json'

class CryptoData
    URLM = "https://api.nomics.com/v1/markets?key=421c2246c0e25e7aad14db3397041634"
    URLC = "https://api.nomics.com/v1/currencies/ticker?key=421c2246c0e25e7aad14db3397041634&ids=BTC,ETH,XRP,LTC,ADA,XLM&interval=1d,30d&convert=USD&per-page=100&page=1"

    def initialize
       @@currencys = JSON.parse(self.get_programs_for_currencies)
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

    def self.all
        @@currencys
    end

    def Get_currency(coin)
        @@currencies.each do |currency_hash|
            if currency_hash["id"] = coin
                return currency_hash
            end
        end
    end


    # def self.currencies_array
    #     self.parsed_currencies
    # end

end
# currency_programs = GetPrograms.new.get_programs_for_currencies
# market_programs = GetPrograms.new.get_programs_for_markets

# parsed_currencies = JSON.parse(currency_programs)
