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

  def test_it_starts_with_a_details_hash
    house = House.new("$400000", "123 sugar lane")

    expected_hash = {"price" => 400000, "address" => "123 sugar lane"}

    assert_equal expected_hash, house.details
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


  def test_it_knows_the_details_of_every_room
    room_1 = Room.new(:bedroom, 10, '13')
    room_2 = Room.new(:bedroom, 11, '15')
    room_3 = Room.new(:living_room, 25, '15')
    room_4 = Room.new(:basement, 30, '41')

    house = House.new("$400000", "123 sugar lane")

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_1, room_2], house.rooms_from_category(:bedroom)
    assert_equal [room_4], house.rooms_from_category(:basement)
    assert_equal [room_3], house.rooms_from_category(:living_room)
  end

end
