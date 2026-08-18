require_relative 'Product'
require_relative 'Cart'
require_relative 'exception'

inventory = {
  1 => PhysicalProduct.new(1, "NoteBooks", 100.0, 5, 1.5),
  2 => DigitalProduct.new(2, "Ruby Book", 59.99, 100, "https://ruby.com/ebook"),
  3 => PhysicalProduct.new(3, "Mechanical Keyboard", 120.00, 8, 1.1),
  4 => DigitalProduct.new(4, "Java Full Stack Masterclass", 49.99, 500, "https://learn.com/java-course"),
  5 => PhysicalProduct.new(5, "Ergonomic Gaming Mouse", 45.50, 0, 0.25), # Out of stock item
  6 => DigitalProduct.new(6, "SQL Quick Reference PDF", 9.99, 250, "https://docs.com/sql-cheat-sheet"),
  7 => PhysicalProduct.new(7, "USB-C Hub (7-in-1)", 35.00, 15, 0.3)
}

cart = Cart.new

loop do 
  
  puts "\n====== E-COMMERRCE CONSOLE STORE ====="
  puts "1. View Products"
  puts "2. Add Products to Cart"
  puts "3. View Cart & Total"
  puts "4. Exit"
  puts "5 . Remove product from Cart"
  print "Select an option: "

  choice = gets.chomp.to_i

  case choice
  when 1
   puts "============= Products ===================="
   inventory.each do |id , item|
     puts "#{id}  #{item.name} - #{item.price} (Stock: #{item.stock})"
   end

  when 2
    begin
    print "Enter Product ID to add : "
    prod_id = gets.chomp.to_i

    raise InvalidInputError , "Product ID not found!" unless inventory.key?(prod_id)
    selected_product = inventory[prod_id]
    
    cart.add_product(selected_product)
    puts "Successfully added #{selected_product.name} to cart!" 
    
    rescue OutOfStockError => e 
      puts "Error: #{e.message}"
    rescue InvalidInputError => e 
      puts "Error: #{e.message}"
    end  

  when 3
    puts "\n --- Your Cart --- "
    lines = cart.generate_receipt_lines

    if lines.empty?
      puts "Your cart is currently empty. "
    else
      puts lines
      puts " Total amount is : #{format('%.2f' , cart.calculate_total)}"
    end

  when 4
    puts "Thank you for shopping !"
    break

  when 5
  begin
    print "Enter Product ID to remove from cart: "
    prod_id = gets.chomp.to_i

    raise InvalidInputError, "Product ID not found in store!" unless inventory.key?(prod_id)

    selected_product = inventory[prod_id]
    cart.remove_product(selected_product)
    puts "Successfully removed '#{selected_product.name}' from your cart!"

  rescue InvalidInputError => e
    puts "Error: #{e.message}"
  end

  else
    puts "Invalid option. Please choose between 1 and 5."
  end

end