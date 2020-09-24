module Beverages
    
    Main_options = ['[C]coffee', '[T]tea', '[S]soft drink']

    Coffee_options = {'[1]Cappuccino' => 4.0, '[2]Flat white' => 4.0, '[3]Latte' => 4.0, '[4]Mocha' => 4.0, '[5]Espresso' => 3.0, '[6]Doppio' => 3.80}

    Tea_options = ['[1]English', '[2]Chamomile', '[3]Peppermint']

    Softdrinks_options = {'[1]Coke' => 3.5, '[2]Redbull' => 5.0, '[3]Sparkling water' => 4.20, '[4]Fresh OJ' => 6.20}

    # Checking whether the argument that is being passed in is an array or a hash so it is printed correctLy
    def Beverages.list_options(options_list)

        options_list_class = options_list.class

        if options_list_class == Hash
            options_list.each { |item, price| puts "#{item} : $#{price}" }
        elsif options_list_class == Array
            options_list.each { |item| puts "#{item}" }
        end
    end
end

module food
    include Beverages
    
end



