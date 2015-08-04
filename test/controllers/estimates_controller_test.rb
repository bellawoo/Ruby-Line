require 'test_helper'

class EstimatesControllerTest < ActionController::TestCase
  test "should route to dock status" do
    get(:bike, {:lat => 38.887823}, {:long => -76.980966} )

    assert_response :success
    assert_not_nil assigns(:bikes)
  end

  test "should route to train predictions" do
    get(:train, {:lat => 38.887823}, {:long => -76.980966})

    assert_response :success
    assert_not_nil assigns(:trains)
  end
end