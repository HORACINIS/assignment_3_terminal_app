module Customer

    class CustomerDetails
        @@customers_created = 0
        def initialize(name, address)
            @name = name
            @address = address
            @@customers_created += 1
        end
        
        def self.created_customers
            puts "customer created #{@@customers_created}"
        end
    end




end