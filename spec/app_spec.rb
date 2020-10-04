require_relative '../customer'

require 'rspec'



describe Customer::CustomerDetails do

    customer = Customer::CustomerDetails.new('Horacinis', 'Lonsdale street, Braddon ACT 2612')        
    coffee = 'Espresso'
    tea = 'Chamomile'


    it "should instantiate a class" do        
        expect(customer.name).to eq('Horacinis')
    end

    it "should add a coffee item to instance variable coffees" do        
        customer.add_to_coffee_list(coffee)
        expect(customer.coffees).to eq('Espresso' => 3.50)
    end

    it "should add a tea item to instance variable teas" do        
        customer.add_to_tea_list(tea)
        expect(customer.teas).to eq('Chamomile' => 3.80)
    end

    it "should output the instance variable total" do
        expect(customer.total).to eq(7.30)
    end    
end