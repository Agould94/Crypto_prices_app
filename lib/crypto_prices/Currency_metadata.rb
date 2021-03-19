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



end
