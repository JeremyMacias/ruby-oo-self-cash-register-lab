require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :price, :quantity, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(items, price, quantity = 1)
        @price = price
        @total += price * quantity
        if quantity > 1
            counter = 0
            while counter < quantity
                @items << items
                counter += 1
            end
        else
            @items << items
        end
    end

    def apply_discount()
        if @discount > 0
            @discount = @discount/100.to_f
            @total = @total - (@total * (@discount))
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end

    end

    
    # @total -= @price   will leave just one failed test ('return total to 0.0')
    def void_last_transaction
        self.total -= self.price[-1]
        if self.items == []
            self.total = 0.0
        end

    end
        



end
