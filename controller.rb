require_relative 'products'
require_relative 'customer'
require "tty-prompt" # tty-prompt gem
require 'colorize' # colorize gem for changing colours for Strings
require 'artii' # artii gem for ASCII  art


module Controller
    include Products
    include Customer
    # include RunApp
    prompt = TTY::Prompt.new

    Logo = 
        '
        ██╗  ██╗ ██████╗ ██████╗  █████╗  ██████╗██╗███╗   ██╗██╗███████╗       
        ██║  ██║██╔═══██╗██╔══██╗██╔══██╗██╔════╝██║████╗  ██║██║██╔════╝       
        ███████║██║   ██║██████╔╝███████║██║     ██║██╔██╗ ██║██║███████╗       
        ██╔══██║██║   ██║██╔══██╗██╔══██║██║     ██║██║╚██╗██║██║╚════██║       
        ██║  ██║╚██████╔╝██║  ██║██║  ██║╚██████╗██║██║ ╚████║██║███████║       
        ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝╚═╝  ╚═══╝╚═╝╚══════╝       
        ██████╗ █████╗ ███████╗███████╗                                         
        ██╔════╝██╔══██╗██╔════╝██╔════╝                                        
        ██║     ███████║█████╗  █████╗                                          
        ██║     ██╔══██║██╔══╝  ██╔══╝                                          
        ╚██████╗██║  ██║██║     ███████╗                                        
         ╚═════╝╚═╝  ╚═╝╚═╝     ╚══════╝                                        '


    # Prints main logo and current time and date
    def Controller.intro(logo)
        puts '---------------------------------------------------------------------------------'
        puts ' ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘'.colorize(:red)
        main_logo = logo.colorize(:red).on_blue.underline  
        
        main_logo.each_char do |character|
            sleep 0.001
            print character
        end
        puts ''

        puts ' ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘ ┌( ಠ_ಠ)┘'.colorize(:red)
        
        puts '---------------------------------------------------------------------------------'
        puts "          ▌│║▌║▌│║║▌█║▌║█ #{Time.now} ▌│║▌║▌│║║▌█║▌║█"
    end
    
    # Asks the customer if their details are correct
    def Controller.checking_customer_info(customer_name, customer_address)
        prompt = TTY::Prompt.new

        sleep(0.5)

        puts "YOUR NAME : #{customer_name.colorize(:light_red)}"
        puts "ADDRESS FOR DELIVERY: #{customer_address.colorize(:light_red)}"     

        ask_if_details_correct = prompt.yes?("Is this information correct?".colorize(:red))
        
        # Asks customer if details entered by them are correct, if customer says no then it will 
        # go into a loop and will ask customer to enter details again then will ask if details entered 
        # are correct. The loop will come to an end when customer confirms that their details are correct
        if ask_if_details_correct
            system('clear')
            puts Logo.colorize(:light_blue ).colorize( :background => :red)
            
            # Loading effect
            sleep(1)
            
            # just a 'loading' effect
            print 'Checking info '
            ".................................".each_char do |c|
                sleep 0.1
                print c
            end
            print ' OK!'.colorize(:light_green)
            sleep(1)

            puts ''
            puts "Thank you for providing your information, #{customer_name.colorize(:light_yellow)}!"
            
            sleep(0.5)

        else
            system('clear')
            puts Logo.colorize(:light_blue ).colorize( :background => :red)

            loop do
                puts ''
                sleep(0.5)
                puts 'Not a problem!'.colorize(:red)
                puts ''

                customer_name = prompt.ask("Your name?\n".colorize(:light_blue)) do |q|
                    q.required true
                    q.validate /\A\w+\Z/
                    q.modify   :capitalize
                end

                sleep(0.5)
    
                customer_address = prompt.ask("Now, your address?\n".colorize(:light_blue)) do |q|
                    q.required true
                    q.modify   :capitalize
                end

                puts ''

                sleep(0.5)

                puts "YOUR NAME : #{customer_name.colorize(:light_red)}"
                puts "ADDRESS FOR DELIVERY: #{customer_address.colorize(:light_red)}"  

                sleep(0.5)

                ask_if_details_correct = prompt.yes?("Is this information correct?".colorize(:red))
                
            break if ask_if_details_correct
            sleep(0.5)
            system('clear')
            puts Logo.colorize(:light_blue ).colorize( :background => :red)
            end
            
            sleep(0.5)

            system('clear')
            puts ''
            puts Logo.colorize(:light_blue ).colorize( :background => :red)
            sleep(1)
            
            # Loading effect
            print 'Checking info '.colorize(:light_green)
            ".................................".each_char do |c|
                sleep 0.1
                print c
            end
            print ' OK!'.colorize(:light_green)
            sleep(0.5)
            puts ''
            puts "Thank you for providing your information, #{customer_name.colorize(:light_yellow)}!"
            sleep(0.8)            
        end    
    end


    # function takes in a question and an array
    # It loops through product array list given
    def Controller.list_product(question, product)
        prompt = TTY::Prompt.new

        prompt.select(question) do |menu|
            count = 0
            
            while count < product.size
                menu.choice "#{product[count]}"
                count += 1
            end
        end
    end

    # function will list questions
    def Controller.ordering_products
        prompt = TTY::Prompt.new

        loop do
            puts ''
            sleep(0.8)
            # Asks to select from main category: coffee, tea or softdrink
            products_category = list_product('Please make your selection ▄▀▄▀▄▀'.colorize(:light_blue), ['Coffee', 'Tea', 'Soft Drink'])
            
            case products_category
            when 'Coffee'
                sleep(0.8)
                puts ''
                # Will print coffee list options, it will return selected coffee
                coffee_question = list_product('What kind of coffee would you like?', Products::Coffees)
                # Adds product(coffee) to products array in CustomerDetails Class
                RunApp::Customer_info.add_to_coffee_list(coffee_question)
                
            when 'Tea'
                sleep(0.8)
                puts ''
                # Will print tea list options
                tea_question = list_product('What kind of tea would you like?', Products::Teas)
                # Adds product(tea) to products array in CustomerDetails Class
                RunApp::Customer_info.add_to_tea_list(tea_question)

            when 'Soft Drink'
                sleep(0.8)
                puts ''
                # Will print soft drinks list options
                softdrink_question = list_product('What kind of soft drink would you like?', Products::SoftDrinks)
                # Adds product(soft drink) to products array in CustomerDetails Class
                RunApp::Customer_info.add_to_softdrink_list(softdrink_question)

            end

            sleep(0.8)
            puts ''
            
            add_anything_else = prompt.yes?("Would you like to add anything else?")

            # Break if add_anything_else question returns false
            break if !add_anything_else

        end     

        sleep(0.8)       
    end

    # just loading effects right after customer is done ordering 
    def Controller.loading_effects

        sleep(2)

        puts ''


        print 'Sending Order '.colorize(:light_green)
        "....................................".each_char do |c|
            sleep 0.2
            print c
        end
        print ' OK!'.colorize(:green)

        sleep(1)

        puts ''

        print 'Generating Receipt '.colorize(:green)
        "...............................".each_char do |c|
            sleep 0.1
            print c
        end
        print ' OK!'.colorize(:light_green)

        sleep(2)

        system('clear')

    end
    
end