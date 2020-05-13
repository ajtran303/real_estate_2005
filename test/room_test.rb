require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'

class RoomTest < Minitest::Test
  def test_it_exists
    room = Room.new(:bedroom, 10, '13')
    assert_instance_of Room, room
  end

  def test_it_has_size_attributes
    room_1 = Room.new(:bedroom, 10, '13')

    assert_equal 10, room_1.length
    assert_equal '13', room_1.width

    room_2 = Room.new(:bedroom, 12, '16')

    assert_equal 12, room_2.length
    assert_equal '16', room_2.width
  end

  def test_it_has_a_category
    room = Room.new(:bedroom, 10, '13')
    assert_equal :bedroom, room.category

    room2 = Room.new(:living_room, 15, '12')
    assert_equal :living_room, room2.category
  end

  def test_it_can_get_area
    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:living_room, 15, '12')
    assert_equal 130, room1.area
    assert_equal 180, room2.area
  end
end
