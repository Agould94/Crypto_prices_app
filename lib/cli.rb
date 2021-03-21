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
        currency_menu
    end

    def exit_app
        puts "Thank you!"
    end

    def currency_menu
        input = @prompt.select("What would you like to do?", [
            "Read the whitepaper for #{currency.name}.", 
            "Add this currency to your portfolio.", 
            "Check this currenies current price.",
            "See #{currency.name}'s details.",
            "Exit"
        ])
        case input
        when "Read the whitepaper for #{currency.name}."
            currency.get_whitepaper
            currency_menu
        when "Add this currency to your portfolio."
            puts "this feature is not yet available"
            currency_menu
        when "Check this currenies current price."
            puts "#{currency.name}'s current price is #{currency.price}"
            currency_menu
        when "See #{currency.name}'s details."
            currency.print_details
            currency_menu
        when "Exit"
            exit_app
        end

    end
end