class Calculator
  
 def add(a,b) 
    a+b
 end

 def sub(a,b)
    a-b
 end

 def product(a,b) 
    a*b
 end

 def divide(a,b)
    a / b
 end

def user_input
  begin
  puts "enter your 1st number"
  num1 = Integer(gets.chomp)
  puts "enter your 2nd number"
  num2 = Integer(gets.chomp)

  puts "1.Addition"
  puts "2.Subtraction"
  puts "3.Multiplication"
  puts "4.Division"
  puts "5. Exit"
  puts ">>>>>>>> Enter your Choice <<<<<<<<<"
  choice = Integer(gets.chomp)

  case choice
  when 1
   puts add(num1,num2)
  when 2
   puts sub(num1 , num2)
  when 3
   puts product(num1 , num2)
  when 4
   puts divide(num1 , num2) 
  else 
   puts "Invalid Operator"
  end
  end

rescue ArgumentError , TypeError , ZeroDivisionError => e
  puts "Error : #{e.message}"
ensure 
  puts "Program is closed"
end
end

c1 = Calculator.new
 c1.user_input