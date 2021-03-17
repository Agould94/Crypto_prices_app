require 'net/http'
require 'open-uri'
require 'json'
class GetPrograms
    URL = "https://api.nomics.com/v1/markets?key=421c2246c0e25e7aad14db3397041634"

    def get_programs
        uri = URI.parse(URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end
end

programs = GetPrograms.new.get_programs
puts programs