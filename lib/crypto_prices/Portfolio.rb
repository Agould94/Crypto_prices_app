class Portfolio
    attr_accessor :coin, :coin_value, :total_value, :num
    @@all = []
    def initialize(currency, num)
        @coin = currency.name
        @coin_value = currency.price
        @num = num
        #@total_value = self.all.map{|coin| coin.coin_value}.sum
        @@all<<self
    end

    def self.all
        @@all
    end

    def self.total_value
        self.all.map{|coin| coin.coin_value.to_i*coin.num.to_i}.sum
    end
end