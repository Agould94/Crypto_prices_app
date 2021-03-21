class Currency
    attr_reader :hash
    attr_accessor :id, :currency, :name, :status, :price, :date, :supply, :market_cap, :num_exchanges, :high, :high_timestamp

    @@all = []

    def initialize(hash)
        @id = hash["id"]
        @currency = hash["currency"]
        @name = hash["name"]
        @status = hash["status"]
        @price = hash["price"]
        @date = hash["price_date"]
        @supply = hash["circulating_supply"]
        @market_cap = hash["market_cap"]
        @num_exchanges = hash["num_exchanges"]
        @high = hash["high"]
        @high_timestamp = hash["high_timestamp"]
        @@all << self
    end

    def self.all
        @@all
    end

    def add_to_portfolio(num)
        self.name = Portfolio.new(self, num)
    end

    def self.find_by_name(name)
        self.all.find{|coin| coin.name == name.capitalize}
    end

    def get_whitepaper
        metadata = MetaData.find_by_name(self.name)
        metadata.print_whitepaper
    end

    def print_details
        puts self.name
        puts "Current_price: #{self.price}"
        puts "Symbol: #{self.id}"
        puts "The Market Capitalization of #{self.name} is $#{self.market_cap}"
        puts "#{self.name} is available on #{self.num_exchanges} different exchanges."
        puts "#{self.name} reached an all-time high of $#{self.high} on #{self.high_timestamp.partition('T').first}"
    end

    def i_own(n)
        crypto = self.price.to_i
        puts "You currently own #{n*crypto} worth of #{self.name}"
    end

    def self.coin_value(name, n)
       coin = self.find_by_name(name).price.to_i
       n*coin
    end

    def my_metadata
        MetaData.find_by_name("#{self.name}")
    end

end


