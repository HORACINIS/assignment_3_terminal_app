

module Customer
    


    class CustomerDetails
        attr_accessor :name, :address, :products
        
        # @@customers_created = 0
        # @@products_ordered = []
        def initialize(name, address)
            @name = name
            @address = address
            @products = []
            # @@customers_created += 1
        end    
        
        def add_product(product)
            @products << product
        end

        def products
            return @products
        end

        def receipt

        end

        # def self.add_to_products_ordered(product)
        #     @@products_ordered.push(product)
        # end

        # def self.created_customers
        # puts "customers created #{@@customers_created}"
        # end

        # def self.printlawea
        #     @@products.each { |product| puts product}
        # end
    end



end


