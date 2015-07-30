require 'test_helper'

class TrainTest < ActiveSupport::TestCase
  test "train info initialized" do
    MetroAPI.next_trains "A03"
    binding.pry
    t = Train.first    
  end
end
