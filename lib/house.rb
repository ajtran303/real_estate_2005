class House
  attr_reader :price,
              :address,
              :rooms


  def initialize(price, address)
    @price = price.delete_prefix("$").to_i
    @address = address
    @rooms = Array.new
  end

end
