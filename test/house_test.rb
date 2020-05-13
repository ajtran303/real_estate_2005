require './lib/room'
require './lib/house'

require 'minitest/autorun'
require 'minitest/pride'

class HouseTest < MiniTest::Test

  def test_it_exists_and_has_attributes
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
    assert_equal 400000, house.price
    assert_equal "123 sugar lane", house.address
  end

  def test_it_starts_with_no_rooms
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of Array, house.rooms
    assert_empty house.rooms
  end

  def test_it_can_add_rooms
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')

    house = House.new("$400000", "123 sugar lane")
    assert_equal [], house.rooms

    house.add_room(room_1)

    assert_equal 1, house.rooms.size
    assert_equal [room_1], house.rooms

    house.add_room(room_2)

    assert_equal 2, house.rooms.size
    assert_equal [room_1, room_2], house.rooms
  end

  def test_it_is_not_above_market_average_if_less_than_500_000
    house = House.new("$400000", "124 sugar lane")

    assert_equal false, house.above_market_average?
  end

  def test_it_is_not_above_market_average_if_exactly_500_000
    house = House.new("$500000", "125 syrup lane")

    assert_equal false, house.above_market_average?
  end

  def test_it_is_above_market_average_if_greater_than_500_000
    house = House.new("$600000", "126 saccha lane")

    assert_equal false, house.above_market_average?
  end

  # room_1 = Room.new(:bedroom, 10, '13')
  # #=> #<Room:0x00007fccd29b5720...>
  #
  # room_2 = Room.new(:bedroom, 11, '15')
  # #=> #<Room:0x00007fccd2985f48...>
  #
  # room_3 = Room.new(:living_room, 25, '15')
  # #=> #<Room:0x00007fccd383c2d0...>
  #
  # room_4 = Room.new(:basement, 30, '41')
  # #=> #<Room:0x00007fccd297dc30...>
  #
  # house.add_room(room_1)
  #
  # house.add_room(room_2)
  #
  # house.add_room(room_3)
  #
  # house.add_room(room_4)
  #
  # house.rooms_from_category(:bedroom)
  # #=> [#<Room:0x00007fccd29b5720...>, #<Room:0x00007fccd2985f48...>]
  #
  # house.rooms_from_category(:basement)
  # #=> [#<Room:0x00007fccd297dc30...>]
  #
  # house.area
  # #=> 1900
  #
  # house.details
  # #=> {"price" => 400000, "address" => "123 sugar lane"}
  #


end
