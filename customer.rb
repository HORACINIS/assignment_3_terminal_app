

module Customer
    


    class CustomerDetails
        attr_reader :name, :address
        
        # @@customers_created = 0
        # @@products = []
        def initialize(name, address)
            @name = name
            @address = address
            # @@customers_created += 1
        end        
        # def self.created_customers
        #     puts "customers created #{@@customers_created}"
        # end

        # def self.add_to_products_ordered(product)
        #     @@products.push(product)
        # end

        # def self.printlawea
        #     @@products.each { |product| puts product}
        # end
    end



end


