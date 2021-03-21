class CLI

    attr_reader :currency
    def initialize
        @prompt = TTY::Prompt.new
        welcome
        menu
    end

    def welcome
        puts "Welcome to your command line Cryptocurrency tracker and portfolio, where you can track various cryptocurrencies and store them in your portfolio!"
    end

    def menu
        input = @prompt.enum_select("What would you like to do?", ["See all supported cryptocurrencies.", "Exit"])
        case input
        when "See all supported cryptocurrencies."
            show_currencies(Currency.all)
        when "Exit"
            exit_app
        end
    end

    def show_currencies(currencies)
        input = @prompt.select("Which currency would you like to view?", currencies.map{|currency| currency.name})
        @currency = Currency.find_by_name(input)
        currency.print_details
    end

    def exit_app
        puts "Thank you!"
    end
end