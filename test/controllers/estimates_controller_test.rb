require 'test_helper'

class EstimatesControllerTest < ActionController::TestCase
  test "should get bike predictions" do
    get(:bike, {:lat => 38.887823}, {:long => -76.980966} )

    assert_response :success
    assert_not_nil assigns(:bikes)
  end

  test "should get train predictions" do
    get(:train, {:lat => 38.887823}, {:long => -76.980966})

    assert_response :success
    assert_not_nil assigns(:trains)
  end
end