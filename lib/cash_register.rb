class CashRegister
    attr_accessor :discount, :total, :items, :last_transaction_price
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times do
        @items << title
      end
      @last_transaction_price = price
    end
  
    def apply_discount
      if @discount == 0
        "There is no discount to apply."
      else
        @total = @total - (@discount * 10)
        "After the discount, the total comes to $#{@total.to_i}."
      end
    end
  
    def void_last_transaction
      @total -= @last_transaction_price
    end
  end