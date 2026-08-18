class Calculator

  def add(a, b)
    a + b
  end

  def sub(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    a / b
  end

  def user_input
    loop do
      begin
        puts "\n========== Calculator =========="
        puts "1. Addition"
        puts "2. Subtraction"
        puts "3. Multiplication"
        puts "4. Division"
        puts "5. Exit"
        print "Enter your choice: "

        choice = Integer(gets.chomp)

        if choice == 5
          puts "Thank you for using Calculator!"
          break
        end

        puts "Enter first number:"
        num1 = Integer(gets.chomp)

        puts "Enter second number:"
        num2 = Integer(gets.chomp)

        result =
          case choice
          when 1
            add(num1, num2)
          when 2
            sub(num1, num2)
          when 3
            multiply(num1, num2)
          when 4
            divide(num1, num2)
          else
            "Invalid Operator"
          end

        puts "Result: #{result}"

      rescue ArgumentError
        puts "Please enter valid integers."

      rescue ZeroDivisionError
        puts "Cannot divide by zero."

      end
    end

    puts "Program Closed."
  end
end

c1 = Calculator.new
c1.user_input