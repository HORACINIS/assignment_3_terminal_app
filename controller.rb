require_relative 'products'
require_relative 'customer'
require "tty-prompt"
# require_relative 'app'


module Controller
    include Products
    include Customer
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

        # Will print coffee list options
        coffee_question = list_product('What kind of coffee would you like?', Products::Coffees)

        # Will print tea list options
        tea_question = list_product('What kind of tea would you like?', Products::Teas)

        # Will print soft drinks list options
        softdrink_question = list_product('What kind of coffee would you like?', Products::SoftDrinks)
    end






end





