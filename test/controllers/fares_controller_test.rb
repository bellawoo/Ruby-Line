require 'test_helper'

class FaresControllerTest < ActionController::TestCase
  test "should route to uber price estimate" do
    get(:uber, {:lat1 => 38.887823, :long1 => -76.980966, :lat2 => 38.973176, :long2 => -77.013878, :riders => 2} )
    
    assert_response :success
    assert_not_nil assigns(:riders)
    assert_not_nil assigns(:ubers)
    assert_not_nil assigns(:vehicles)
  end

  test "should get metro fare estimate" do
    TrainStation.stations
    get(:train, {:lat1 => 38.887823, :long1 => -76.980966, :lat2 => 38.973176, :long2 => -77.013878, :riders => 2} )

    assert_response :success
    assert_not_nil assigns(:riders)
    assert_not_nil assigns(:train_trip)
  end
end