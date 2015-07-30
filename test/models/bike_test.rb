require 'test_helper'

class BikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "bike stations in db" do
    Bike.docks

    assert_equal 353, Bike.count
  end

  test "calculate distance" do
    Bike.docks
    fixed_dock = Bike.find_by_id(1)
    sample_distance = fixed_dock.distance 38.887823,-76.980966
    miles = sample_distance.to_mi

    assert_equal 4.364798612608837, miles
  end

  test "find closest docks" do
    Bike.docks
    five_docks = Bike.closest_docks 38.887823,-76.980966
    closest_dock_distance = five_docks.first.distance 38.887823,-76.980966
    
    assert_in_delta 0.05, closest_dock_distance.to_mi, 0.1
    assert_equal 5, five_docks.count
  end
end