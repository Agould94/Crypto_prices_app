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
        if @user
            input = @prompt.enum_select("What would you like to do?", ["See all supported cryptocurrencies.", "Exit"])
            case input
            when "See all supported cryptocurrencies."
            show_currencies(Currency.all)
            when "Exit"
            exit_app
            end
        else
            prompt_login
            menu
        end
    end

    def prompt_login
        username = @prompt.ask("What is your username?")
        @user = User.find_or_create(username)
    end

    def show_currencies(currencies)
        input = @prompt.select("Which currency would you like to view?", currencies.map{|currency| currency.name})
        @currency = Currency.find_by_name(input)
        currency.print_details
        currency_menu
    end

    def print_portfolio
        Portfolio.print_portfolio
    end

    def exit_app
        puts "Thank you!"
    end

    def currency_menu
        input = @prompt.select("What would you like to do?", [
            "Read the whitepaper for #{currency.name}.", 
            "Add this currency to your portfolio.", 
            "Check this currencies current price.",
            "See #{currency.name}'s details.",
            "Logout",
            "Exit"
        ])
        case input
        when "Read the whitepaper for #{currency.name}."
            currency.get_whitepaper
            currency_menu
        when "Add this currency to your portfolio."
            num = @prompt.ask("How many #{currency.name} would you like to add to your portfolio") do |n|
                    n.validate(/\d/)
                    end
             portfolio = currency.add_to_portfolio(num.to_i)#, @user.username)
           # portfolio.add_user(@user.username) #|| portfolio.find_by_username(@user.username)
            puts "Your Portfolio:"
            Portfolio.print_portfolio #print_user_portfolio(@user.username) #print_portfolio
            currency_menu
        when "Check this currencies current price."
            puts "#{currency.name}'s current price is #{currency.price}"
            currency_menu
        when "See #{currency.name}'s details."
            currency.print_details
            currency_menu
        when "Logout"
            logout
        when "Exit"
            exit_app
        end
    end

    def logout
        @user = nil
        menu
    end
end