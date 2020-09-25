require_relative 'controller'
require_relative 'customer'
require "tty-prompt"

include Controller
include Customer

# This a requirement to be able to use the tty prompt feature
prompt = TTY::Prompt.new

puts '---------------------------------------'
puts 'Welcome to my virtual takeaway cafe'
puts Time.now
puts '---------------------------------------'


# Asks customer to provide name and address
name = prompt.ask("May I have your name?")
address = prompt.ask("Now, we need your address to deliver your coffee to\n")

# Asks customer if name and address entered are correct
Controller.checking_customer_info(name, address)

puts "Thank you for providing your information #{name}"

# Creates a customer Object - used later for printing receipt
customer = Customer::CustomerDetails.new(name, address)




puts 'What would you like to order today?'


Controller.list_options(Controller::Main_options) # Iterate through the main list of options in Controller module and displays it

main_input = gets.chomp.downcase #coffee, tea, soft drink input from customer



if main_input == 'coffee' || main_input == 'c'

    puts '-----------COFFEES----------------'
    Controller.list_options(Controller::Coffee_options) #iterates and prints constant array Coffee_options from Controller module 
    
elsif main_input == 'tea' || main_input == 't'

    puts '-------------TEAS-----------------'
    Controller.list_options(Controller::Tea_options) #iterates and prints constant array Tea_options from Controller module 

elsif main_input == 'soft drink' || main_input == 's'
    puts '----------SOFT DREANKS--------'
    Controller.list_options(Controller::Softdrinks_options)
else
    puts 'Wrong Input'
end












