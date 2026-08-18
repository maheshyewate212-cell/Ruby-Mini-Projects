class OutOfStockError < StandardError; end

class InvalidInputError < StandardError; end

module Discountable
  def apply_discount(percentage)
    discount_amount = @price * (percentage/100.0)
    @price-=discount_amount
  end
end