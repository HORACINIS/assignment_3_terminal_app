require_relative 'controller'
require_relative 'customer'
require_relative 'products'
require "tty-prompt"

module RunApp   

    include Controller
    include Customer
    include Products

    # This a requirement to be able to use the tty prompt feature
    prompt = TTY::Prompt.new

    puts '---------------------------------------'
    puts 'Welcome to my virtual takeaway cafe'
    puts Time.now
    puts '---------------------------------------'


    # Asks customer to provide name
    name = prompt.ask("May I have your name?\n") do |q|
        q.required true
        q.validate /\A\w+\Z/
        q.modify   :capitalize
    end
    # Asks customer to provide address for delivery
    address = prompt.ask("Now, we need your address to deliver your coffee to\n") do |q|
        q.required true
        q.modify   :capitalize
    end
    # -------------------------------------------------------------------------------

    # Asks customer if name and address entered are correct and doesn't go furhter untill 
    # customer has entered their details correctly
    Controller.checking_customer_info(name, address)

    # Creates a customer Object - used later for printing receipt
    Customer = Customer::CustomerDetails.new(name, address)
    # puts "Customer's name is #{customer.name}" ESTO SE PUEDE BORRAR
    # puts "Customer's address is #{customer.address}" ESTO TAMBIEN TOCA BORRAR

    
    Controller.ordering_products
    







end








