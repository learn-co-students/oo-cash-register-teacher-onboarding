class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0)
    @discount = discount
    @total = 0
    @items = []
    @last = nil
  end

  def add_item(item, cost, quantity = 1)
    @total += cost * quantity
    @items.push(*Array.new(quantity, item))
    @last = { :item => item, :cost => cost, :quantity => quantity }
  end

  def items
    @items
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total = @total * (100 - @discount) / 100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @items.pop(@last[:quantity])
    @total -= @last[:quantity] * @last[:cost]
  end
end
