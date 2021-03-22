
require "bundler"
require 'pry'
Bundler.require
Dotenv.load

require_relative "../lib/cli.rb"
require_relative "../lib/crypto_prices/currencies.rb"
require_relative "../lib/crypto_prices/Currency_metadata.rb"
require_relative "../lib/nomics_api.rb"
require_relative "../lib/crypto_prices/Markets.rb"
require_relative "../lib/User/portfolio/Portfolio.rb"
require_relative "../lib/User/portfolio/User.rb"
require_relative "./seeds.rb"
 
#binding.pry
