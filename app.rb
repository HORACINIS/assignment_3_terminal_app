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

    # Shows intro logo and time
    Controller.intro


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
    Customer_info = Customer::CustomerDetails.new(name, address)

    # Runs ordering process
    Controller.ordering_products

    # Testing
    puts "This is the customer's name #{Customer_info.name}"







end








