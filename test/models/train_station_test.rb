require 'test_helper'

class TrainStationTest < ActiveSupport::TestCase

  Token = Figaro.env.wmata_api_key

  test "train db starts empty" do
    t = TrainStation.count

    assert_equal 0, t
  end

  test "metro stations save to db" do
    t = TrainStation.stations

    refute_nil true, t
    assert_equal true, t.count >= 95
  end

  test "closest station by distance" do
    t = TrainStation.stations
    lat, long = 38.899016, -77.021971
    t = TrainStation.closest_station lat, long

    assert_equal 2, t.count
    assert_equal "Gallery Place", t.first.name
    assert_equal "Gallery Place", t.last.name
  end
end
