
require "bundler"
require 'pry'
Bundler.require
Dotenv.load

require_relative "../lib/crypto_prices/currencies.rb"
require_relative "../lib/crypto_prices/Currency_metadata.rb"
require_relative "../lib/nomics_api.rb"
require_relative "./seeds.rb"
 
binding.pry
