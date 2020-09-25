require_relative 'items_costs'
require_relative 'customer'
require "tty-prompt"
# require_relative 'app'


module Controller
    include ItemsCosts
    include Customer
    
    Main_options = ['[C]coffee', '[T]tea', '[S]soft drink']

    Coffee_options = ItemsCosts::Coffees

    Tea_options = ItemsCosts::Teas

    Softdrinks_options = ItemsCosts::SoftDrinks

    #Asks the customer if their details are correct
    def Controller.checking_customer_info(customer_name, customer_address)
    
        puts "NAME : #{customer_name}"
        puts "ADDRESS : #{customer_address}" 
    
        puts "Is this information correct? - [Y]yes or [N]No"
        ask_if_details_correct = gets.chomp.downcase

        if ask_if_details_correct == 'yes' || ask_if_details_correct == 'y'

        else

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





