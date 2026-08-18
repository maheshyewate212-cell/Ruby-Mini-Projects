require_relative 'exception'

class Product
  attr_accessor :id , :name , :price ,:stock

  def initialize(id, name , price , stock)
    @id = id
    @name = name
    @price = price
    @stock = stock    
  end

  def calculate_final_price
    @price
  end
end

class PhysicalProduct < Product
  attr_accessor :weight

  def initialize(id , name , price , stock ,weight)
    super(id , name , price , stock )
    @weight = weight
  end

  def calculate_final_price
    @price+(@weight*2)
  end

end


class DigitalProduct < Product
  attr_accessor :download_link
  
  def initialize(id , name , price , stock ,download_link)
    super(id , name , price , stock )
    @download_link = download_link
  end

end