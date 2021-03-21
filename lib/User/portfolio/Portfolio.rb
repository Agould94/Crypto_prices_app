class Portfolio
    attr_accessor :name, :coin_value, :total_value, :num
    @@all = []
    def initialize(currency, num)
        @name = currency.name
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

    def self.find_by_name(name)
        self.all.find{|coin| coin.name == name}
    end

    def self.create(hash, num)
        self.new(hash, num)
    end

    def self.find_or_create(name, hash, num)
        name = self.find_by_name(name) || self.create(hash, num)
    end
end