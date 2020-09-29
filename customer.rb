

module Customer
    


    class CustomerDetails
        attr_accessor :name, :address, :products, :coffees, :teas, :soft_drinks, :total
        
        def initialize(name, address)
            @name = name
            @address = address
            @coffees = {}
            @teas = {}
            @soft_drinks = {}
            @total = 0
        end    

        
        def add_to_coffee_list(coffee)
            price = 0
            case coffee
            when 'Espresso'
                price = 3.50
            when 'Mocha'
                price = 4.50
            else
                price = 4.00
            end
            @coffees[coffee] = price
            @total += price
        end

        def add_to_tea_list(tea)
            price = 0
            case tea
            when 'English Breakfast'
                price = 4.20
            else
                price = 3.80
            end
            @teas[tea] = price
            @total += price
        end

        def add_to_softdrink_list(soft_drink)
            case soft_drink
            when 'Coke'
                price = 2.40
            when 'Redbull'
                price = 5.00
            when 'Sparkling water'
                price = 4.00
            when 'Fresh OJ'
                price = 6.90
            else
                price = 3.00
            end
            @soft_drinks[soft_drink] = price
            @total += price
        end


        def receipt
            # prints main logo
            Controller.intro(Controller::Logo)
            puts '          ▌║█║▌│║▌│║▌║▌█║       R E C E I P T       ▌│║▌║▌│║║▌█║▌║█'
            puts ''
            puts '          -----------------------ITEMS ORDERED --------------------'
            puts ''

            
            if !@coffees.empty?
                @coffees.each {|coffee, cost| puts "                   #{coffee} ................. $ #{cost}"}
            end
            if !@teas.empty?
                @coffees.each {|tea, cost| puts "                   #{tea} ................. $ #{cost}"}
            end
            if !@soft_drinks.empty?
                @soft_drinks.each {|soft_drink, cost| puts "                   #{soft_drink} ................. $ #{cost}"}
            end

            puts ''
            puts '         #########################################################'
            puts ''
            puts "                         ::: TOTAL AMOUNT  $ #{@total} :::"

            puts '          ▌║█║▌│║▌│║▌║▌█║▌│║▌║▌│║║▌█║▌║█▌║█║▌│║║█▌║█▌│║▌║▌│║║▌█║▌║█'
            puts '          ▌║█║▌│║▌│║▌║▌█║       R E C E I P T       ▌│║▌║▌│║║▌█║▌║█'

        end


    end



end


