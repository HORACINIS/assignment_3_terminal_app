require_relative 'beverages'
include Beverages

puts 'Welcome to my virtual takeaway cafe'
puts '---------------------------------------'

puts 'What would you like to order?'


Beverages.list_options(Beverages::Main_options) # Iterate through the main list of options in Beverages module and displays it

first_input = gets.chomp.downcase



if first_input == 'coffee' || first_input == 'c'

    puts '-----------COFFEES----------------'
    Beverages.list_options(Beverages::Coffee_options) #iterates and prints constant array Coffee_options from Beverages module 
    
elsif first_input == 'tea' || first_input == 't'

    puts '-------------TEAS-----------------'
    Beverages.list_options(Beverages::Tea_options) #iterates and prints constant array Tea_options from Beverages module 

elsif first_input == 'soft drink' || first_input == 's'
    puts '----------SOFT DREANKS--------'
    Beverages.list_options(Beverages::Softdrinks_options)
else
    puts 'Wrong Input'
end













