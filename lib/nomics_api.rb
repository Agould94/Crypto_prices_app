require 'net/http'
require 'open-uri'
require 'json'

class CryptoData

    URLM = "https://api.nomics.com/v1/markets?key=#{ENV["KEY"]}&exchange=binance&base=BTC,ETH,LTC,XMR&quote=BTC,ETH,BNB"
    URLC = "https://api.nomics.com/v1/currencies/ticker?key=#{ENV["KEY"]}&ids=BTC,ETH,XRP,LTC,ADA,XLM,COMP,DOGE,BAT&interval=1d,30d&convert=USD&per-page=100&page=1"
    URLCM = "https://api.nomics.com/v1/currencies?key=#{ENV["KEY"]}&ids=BTC,ETH,XRP,LTC,ADA,XLM,COMP,DOGE,BAT&attributes=id,name,logo_url,website_url,medium_url,github_url,whitepaper_url"
    attr_reader :currencies 
    attr_accessor :metadata, :markets, :ids
    @@ids = ["BTC","ETH","XRP","LTC","ADA","XLM"]
    def initialize
       @currencies = JSON.parse(self.get_programs_for_currencies)
       sleep 1
       @metadata = JSON.parse(self.get_currency_metadata)
       #sleep 1
       #@markets = JSON.parse(self.get_programs_for_markets)
    end

    def self.currency_url(array)
       "https://api.nomics.com/v1/currencies/ticker?key=#{ENV["KEY"]}&ids=#{array.join(",")}&interval=1d,30d&convert=USD&per-page=100&page=1"
    end

    def self.ids
        @@ids
    end

    def self.add_coin(coin)
        self.ids << coin
    end

    def get_programs_for_markets
        uri = URI.parse(URLM)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def get_currency_metadata
        uri = URI.parse(URLCM)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def get_programs_for_currencies
        uri = URI.parse(CryptoData.currency_url(CryptoData.ids))
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def self.all
        @@currencies
    end

    def self.add_currency(coin)
        CryptoData.add_coin(coin)
        CryptoData.new.currencies.each do |currency| 
            if currency["id"] == coin
                Currency.new(currency)
            end
        end
    end

    def get_currency(coin)
        @currencies.each do |currency_hash|
            if currency_hash["id"] == coin
                return currency_hash
            end
        end
    end

end

