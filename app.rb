require_relative 'controller'
require_relative 'customer'
require_relative 'products'
require "tty-prompt"
require 'colorize'

module RunApp   

    include Controller
    include Customer
    include Products

    # This a requirement to be able to use the tty prompt feature
    prompt = TTY::Prompt.new

    # Shows intro logo and time
    Controller.intro(Controller::Logo)


    sleep(0.5)
    # Asks customer to provide name
    name = prompt.ask("May I have your name?\n") do |q|
        q.required true
        q.validate /\A\w+\Z/
        q.modify   :capitalize
    end
    sleep(0.5)
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









    # FROM THIS POINT ONLY
    # I NEED TO BE ABLE TO PRINT THE RECEIPT...
    

    "..............................".each_char do |c|
        sleep 0.1
        print c
    end

    sleep(5)

    system('clear')

    # Testing
    Controller.intro(Controller::Logo)
    puts "This is the customer's name #{Customer_info.name}"
    puts "These are the coffees #{Customer_info.coffees}"
    puts "These are the teas #{Customer_info.teas}"
    puts "These are the softdrinks #{Customer_info.soft_drinks}"
    puts "This is the total #{Customer_info.receipt}"






end



















