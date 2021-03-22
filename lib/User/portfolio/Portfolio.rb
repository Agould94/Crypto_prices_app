class Portfolio
    attr_accessor :name, :coin_value, :total_value, :num, :user
    @@all = []
    def initialize(currency, num, name = nil)
        @name = currency.name
        @coin_value = currency.price
        @num = num
        @user = User.find_by_username(name)
        #@user = User.find_or_create(username)
        #@total_value = self.all.map{|coin| coin.coin_value}.sum
        @@all<<self
    end

    def self.all
        @@all
    end

    def self.total_value
        self.all.map{|coin| coin.coin_value.to_i*coin.num.to_i}.sum
    end

    def self.find_by_username(name)
        self.find{|coin| coin if coin.user.username == name}
    end

    def self.find_by_coin_name(coin_name)
        self.all.find{|coin| coin.name == name}
    end

    def self.find_by_username_and_name(name, coin_name)
        self.find_by_coin_name(coin_name).find_by_username(name)
        #self.find_by_coin_name(coin_name)
    end

    def add_user(name)
        @user = User.find_by_username(name)
    end

    def self.create(hash, num, name)
        self.new(hash, num, name)
    end

    def self.find_or_create(name, hash, num)
        name = self.find_by_name(name) || self.create(hash, num, name)
    end

    def self.find_portfolio
        self.all.select{}
    end

    def self.print_portfolio
        self.all.map do |coin| 
            puts "#{coin.name}: #{coin.num} : $#{(coin.num.to_i)*(coin.coin_value.to_i)}"
        end
    end

    def self.print_user_portfolio(name)
        portfolio = self.find_by_username(name)
        puts "#{name}'s portfolio."
        portfolio.map do |coin|
            puts "#{coin.name}: #{coin.num} : $#{(coin.num.to_i)*(coin.coin_value.to_i)}"
        end
    end
end