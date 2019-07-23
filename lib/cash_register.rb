class CashRegister

  attr_accessor :total
  attr_reader :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    @last_transaction = price*quantity
    @total += @last_transaction
    until quantity == 0
      @items.push(title)
      quantity -= 1
    end
  end

  def apply_discount
    @total = @total*(100 - @discount)/100
    if @discount == 0
      return "There is no discount to apply."
    else
      return "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end