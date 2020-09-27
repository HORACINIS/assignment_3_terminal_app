require_relative 'products'
require_relative 'customer'
# require_relative 'app'
require "tty-prompt"


module Controller
    include Products
    include Customer
    # include RunApp
    prompt = TTY::Prompt.new
    
    #Asks the customer if their details are correct
    def Controller.checking_customer_info(customer_name, customer_address)
        prompt = TTY::Prompt.new
        # count

        puts "YOUR NAME : #{customer_name}"
        puts "ADDRESS FOR DELIVERY: #{customer_address}"     

        ask_if_details_correct = prompt.yes?("Is this information correct?")
        
        if ask_if_details_correct
            puts "Thank you for providing your information, #{customer_name}!"

        else

            loop do
                puts 'Not a problem!'

                customer_name = prompt.ask("Your name?\n") do |q|
                    q.required true
                    q.validate /\A\w+\Z/
                    q.modify   :capitalize
                end
    
                customer_address = prompt.ask("Now, your address?\n") do |q|
                    q.required true
                    q.modify   :capitalize
                end

                ask_if_details_correct = prompt.yes?("Is this information correct?")
            break if ask_if_details_correct

            end
            puts "Thank you for providing your information, #{customer_name}"
        end    
    end



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



    def Controller.ordering_products
        prompt = TTY::Prompt.new

        # Asks to select from main category: coffee, tea or softdrink
        products_category = list_product('Please make your selection', ['Coffee', 'Tea', 'Soft Drink'])
        
        case products_category
        when 'Coffee'
            # Will print coffee list options, it will return selected coffee
            coffee_question = list_product('What kind of coffee would you like?', Products::Coffees)
            
            Customer::CustomerDetails.add_to_products_ordered(coffee_question)
            # puts "Esta wea de producto hay hasta ahora: : : #{Customer::CustomerDetails.printlawea}"
            
            prompt.yes?("Would you like to add another coffee?")
        when 'Tea'
            puts 'wena, TEA!'
        when 'Soft Drinks'
            puts 'wena, SOFT DRINK!'
        end

        


        # Will print tea list options
        tea_question = list_product('What kind of tea would you like?', Products::Teas)

        # Will print soft drinks list options
        softdrink_question = list_product('What kind of coffee would you like?', Products::SoftDrinks)
    end






end





