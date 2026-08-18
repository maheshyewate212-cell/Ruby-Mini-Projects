require_relative 'exception'

class Cart 
  
  def initialize
    @items = []
  end

  def add_product(product)
    raise OutOfStockError if product.stock <=0
    @items << product

    product.stock-=1
  end

  def calculate_total
  sum = 0.0
  @items.each do |item|
    sum += item.calculate_final_price
  end

  sum
  end

=begin
  def calculate_total
    # .map extracts calculated final prices; .sum totals them up
    @items.map(&:calculate_final_price).sum
  end
=end

  def generate_receipt_lines
     @items.map.with_index(1) do |item, index|
    "#{index}. #{item.name} - $#{format('%.2f', item.calculate_final_price)}"
     end
  end

  def remove_product(product)
    raise InvalidInputError , "Invalid ID entered"  unless @items.include?(product)
    index = @items.index(product)
    @items.delete_at(index)

    product.stock+=1
  end

end