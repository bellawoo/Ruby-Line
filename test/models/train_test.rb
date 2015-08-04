require 'test_helper'

class TrainTest < ActiveSupport::TestCase
  test "train info initialized" do
    t = MetroAPI.next_trains "A03"
    tt = t.first.line.first
    assert_includes "RD", tt
  end
end
