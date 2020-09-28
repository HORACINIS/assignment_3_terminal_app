

module Customer
    


    class CustomerDetails
        attr_accessor :name, :address, :products, :coffees, :teas, :soft_drinks, :total
        
        # @@customers_created = 0
        # @@products_ordered = []
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


            puts '------------------------'
            puts '------Items ordered------'
            puts "The total amount is ::: $#{@total}"

        end


    end



end


