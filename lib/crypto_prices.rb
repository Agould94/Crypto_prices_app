# frozen_string_literal: true

require_relative "crypto_prices/version"
require_relative "crypto_prices/nomics_api"

module CryptoPrices
  class Error < StandardError; end

  class Cryptocurrency
    attr_accessor :name, :current_price, :available_markets
  
    @@all = []

    def initialize(name=nil, current_price=0, available_markets=nil)
      @name = name
      @current_price = current_price
      @available_markets = available_markers
    end


  end










end


