class Currency
    attr_reader :hash
    attr_accessor :id, :currency, :name, :status, :price, :date, :supply

    @@all = []

    def initialize(hash)
        #hash = CryptoData.new.get_currency(coin)
        @id = hash["id"]
        @currency = hash["currency"]
        @name = hash["name"]
        @status = hash["status"]
        @price = hash["price"]
        @date = hash["price_date"]
        @supply = hash["circulating_supply"]
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find{|coin| coin.name == name.capitalize}
    end

    # def currency_ids(input)
#     input.each do |currency|
#         puts currency["id"]
#     end
# end

# def currency_names(input)
#     input.each do |currency|
#         puts currency["name"]
#     end
# end

#build a class
# 
#binding.pry
#p parsed[][][]
end


