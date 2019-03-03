class CashRegister
  attr_accessor :discount, :total
  attr_reader :items, :prices
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @prices = []
  end
  def add_item(title, price, quantity=1)
    (1..quantity).each {
      @items << title
    }
    @prices << price * quantity
    @total += price * quantity
  end
  def apply_discount
    @total *= 1 - @discount * 0.01
    discount_message = "After the discount, the total comes to $#{@total.to_i}."
    no_discount_message = "There is no discount to apply."
    @discount > 0 ? discount_message : no_discount_message
  end
  def void_last_transaction
    @items.pop
    @total -= @prices.last
    @prices.pop
  end
end
