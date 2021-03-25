class MetaData
    attr_accessor :website_url, :whitepaper_url, :name

    @@all = []

    def initialize(hash)
        @name = hash["name"]
        @website_url = hash["website_url"]
        @whitepaper_url = hash["whitepaper_url"] 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find{|coin| coin.name == name}
    end

    def print_whitepaper
        if @whitepaper_url == ""
            puts "There is no Whitepaper available for #{self.name}"
        else 
            puts "You can read the whitepaper for this currency at #{@whitepaper_url}"
        end
    end


end
