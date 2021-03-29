class Portfolio
    attr_accessor :name, :coin_value, :total_value, :num, :user
    @@all = []
    def initialize(currency, num, name = nil)
        @name = currency.name
        @coin_value = currency.price
        @num = num
        @user = User.find_by_username(name)
        @@all<<self
    end

    def self.all
        @@all
    end

    def self.total_value
        self.all.map{|coin| coin.coin_value.to_f.round(2)*coin.num.to_f.round(2)}.sum
    end

    def self.find_by_username(name)
        self.all.select{|coin| coin if coin.user.username == name}
    end

    def self.find_by_coin_name(coin_name)
        self.all.find{|coin| coin.name == coin_name}
    end

    def self.find_by_username_and_name(name, coin_name)
        self.find_by_username(name).find{|coin| coin.name == coin_name}
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


    def self.print_portfolio
        self.all.map do |coin| 
            puts "#{coin.name}: #{coin.num} : $#{(coin.num.to_f.round(2))*(coin.coin_value.to_f.round(2))}"
        end
    end

    def self.portfolio_total(name)
        t = self.find_by_username(name).map{|coin| coin.num.to_f*coin.coin_value.to_f}.sum
        sprintf("%0.02f", t)
    end

    def self.print_user_portfolio(name)
         portfolio = self.find_by_username(name)
        if portfolio.length > 0
            puts "#{name.capitalize}'s portfolio:"
            portfolio.map do |coin|
                if coin.num.to_f.round(2) > 0
                    puts "#{coin.name}: #{coin.num} : $#{sprintf("%0.02f", coin.num.to_f*coin.coin_value.to_f)}"
                else
                    nil
                end
            end
            puts "Portfolio total: $#{self.portfolio_total(name)}"
        else
            puts "Your portfolio is currently empty"
        end
    end
end