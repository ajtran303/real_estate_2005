class House
  attr_reader :price,
              :address,
              :rooms


  def initialize(price, address)
    @price = digit(price)
    @address = address
    @rooms = Array.new
    @details = Hash.new
  end

  def add_room(room)
    @rooms << room
  end

  def digit(price_str)
    price_str.delete_prefix("$").to_i
  end

  def details
    @details["price"] = @price
    @details["address"] = @address
    @details
  end

end
