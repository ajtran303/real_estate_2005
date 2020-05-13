require './lib/room'
require './lib/house'

require 'minitest/autorun'
require 'minitest/pride'

class HouseTest < MiniTest::Test

  def setup

  end


  def test_it_exists_and_has_attributes
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
    assert_equal 400000, house.price
    assert_equal "123 sugar lane", house.address
    assert_equal [], house.rooms
  end

end
