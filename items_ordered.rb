module ItemsOrdered

    class DrinkType
        attr_accessor :type, :quantity
        @@total_quantity = 0
        @@types_with_prices = {}

        def initialize(type, quantity)
            @type = type
            @quantity = quantity
            @@total_quantity += quantity
        end

        def self.drinks_quantity

        end


    end

    class Coffees < DrinkType

    end

    class Teas < DrinkType

    end

    class SoftDrinks < DrinkType

    end


end