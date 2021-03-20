class Markets
    attr_accessor :exchange, :market, :base, :quote
    @@all = []

    def initialize(hash)
        @base = hash["base"]
        @quote = hash["quote"]
        @market = hash["market"]
        @exchange = hash["exchange"]
        @@all<< self
    end

    def self.all
        @@all
    end
end
