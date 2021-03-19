CryptoData.new.currencies.each{|currency| Currency.new(currency)}
sleep 2 
CryptoData.new.metadata.each{|metadata| MetaData.new(metadata)}
