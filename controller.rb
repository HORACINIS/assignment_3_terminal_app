require_relative 'items_costs'
require_relative 'customer'
require "tty-prompt"
# require_relative 'app'


module Controller
    include Products
    include Customer
    prompt = TTY::Prompt.new
    
    Main_options = ['[C]coffee', '[T]tea', '[S]soft drink']


    Tea_options = Products::Teas

    Softdrinks_options = Products::SoftDrinks

    #Asks the customer if their details are correct
    def Controller.checking_customer_info(customer_name, customer_address)
        prompt = TTY::Prompt.new
        count = 3

        puts "YOUR NAME : #{customer_name}"
        puts "ADDRESS FOR DELIVERY: #{customer_address}"     
        

        while count > 0
            ask_if_details_correct = prompt.yes?("Is this information correct?")
            if ask_if_details_correct
                puts "Thank you for providing your information, #{customer_name}"



                break
            else
                count -= 1
                puts 'Not a problem!'
                customer_name = prompt.ask("What's your name?") do |q|
                    q.required true
                    q.validate /\A\w+\Z/
                    q.modify   :capitalize
                end
                customer_address = prompt.ask("Now, what's your address to deliver your coffee to\n") do |q|
                    q.required true
                    q.modify   :capitalize
                end

                puts "YOUR NAME : #{customer_name}"
                puts "ADDRESS FOR DELIVERY: #{customer_address}" 
                ask_if_details_correct = prompt.yes?("Is this information correct?")
                if ask_if_details_correct
                    puts "Thank you for providing your information, #{customer_name}"
        
                    break
                end
            end
        end
    end


    # Checking whether the list of options that is being passed in is an array or a hash so it is printed correctLy
    def Controller.list_options(options_list)

        options_list_class = options_list.class

        if options_list_class == Hash
            options_list.each { |item, price| puts "#{item} : $#{price}" }
        elsif options_list_class == Array
            options_list.each { |item| puts "#{item}" }
        end
    end


    
end





