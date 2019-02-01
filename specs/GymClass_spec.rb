require("minitest/autorun")
require("minitest/rg")
require_relative("../models/GymClass")

class GymClassTest < MiniTest::Test
  def setup
    @gym_class = GymClass.new({"title" =>"Spinning", "capacity" => "20"})
  end

  def test_gym_class_has_title
      assert_equal("Spinning", @gym_class.title)
  end

  def test_gym_class_has_capacity
      assert_equal(20, @gym_class.capacity)  ###### 
  end

end
