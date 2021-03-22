class Currency
    attr_reader :hash
    attr_accessor :id, :currency, :name, :status, :price, :date, :supply, :market_cap, :num_exchanges, :high, :high_timestamp, :price_change

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
        @price_change = hash["1d"]["price_change"]
        @@all << self
    end

    def self.all
        @@all
    end

    def parse_last_day
        if @price_change[0] == "-"
            puts "#{self.name}'s price has decreased by $#{@price_change.delete_prefix("-").to_f.round(2)} in the last day."
        else
            puts "#{self.name}'s price has increased by $#{@price_change.to_f.round(2)} in the last day."
        end
    end

    def add_to_portfolio(num, name)
        #p = Portfolio.find_by_username(name)
        if c = Portfolio.find_by_username_and_name(name, self.name) #self.name) #Portfolio.find_by_username(name)
            c.num += num
        else Portfolio.create(self, num, name)
        end
    end

    def subtract_from_portfolio(num, name)
        c = Portfolio.find_by_username_and_name(name, self.name)
        c.num -= num
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
        puts "Current_price: #{self.price.to_f.round(2)}"
        puts "Symbol: #{self.id}"
        puts "The Market Capitalization of #{self.name} is $#{self.market_cap}"
        puts "#{self.name} is available on #{self.num_exchanges} different exchanges."
        puts "#{self.name} reached an all-time high of $#{self.high.to_f.round(2)} on #{self.high_timestamp.partition('T').first}"
        parse_last_day
    end

    def i_own(n)
        crypto = self.price.to_f.round(2)
        puts "You currently own #{n*crypto} worth of #{self.name}"
    end

    def self.coin_value(name, n)
       coin = self.find_by_name(name).price.to_f.round(2)
       n*coin
    end

    def my_metadata
        MetaData.find_by_name("#{self.name}")
    end

    def self.convert(coin1, coin2)
        one = self.find_by_name(coin1)
        two = self.find_by_name(coin2)
        q = one.price.to_f 
        r = two.price.to_f
        convert = q/r
        puts "One #{one.name} is worth #{convert} #{two.name}"

    end

end


