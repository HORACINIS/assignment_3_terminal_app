require_relative 'controller'
require_relative 'customer'
require "tty-prompt"

include Controller
include Customer

prompt = TTY::Prompt.new # This is a requirement to be able to use the tty prompt feature

puts 'Welcome to my virtual takeaway cafe'
puts '---------------------------------------'
puts Time.now





name = prompt.ask("May I have your name?")
address = prompt.ask("Now, we need your address to deliver your coffee to")
puts "Thank you for providing your information #{name}"

Customer::CustomerDetails.new(name, address)


# Controller.checking_customer_info(name, address)








opciones = prompt.select("Choose your destiny?", %w(coffee tea soft drink))
# =>
# Choose your destiny? (Use ↑/↓ arrow keys, press Enter to select)
# ‣ Scorpion
#   Kano
#   Jax




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












