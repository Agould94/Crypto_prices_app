CryptoData.new.currencies.each{|currency| Currency.new(currency)}
sleep 1
CryptoData.new.metadata.each{|metadata| MetaData.new(metadata)}
sleep 1
CryptoData.new.markets.each{|market| Markets.new(market)}
