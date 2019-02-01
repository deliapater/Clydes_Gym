require("minitest/autorun")
require("minitest/rg")
require_relative("../models/Member")

class MemberTest < MiniTest::Test
    def setup
      @member = Member.new({"first_name" =>"Juan", "last_name" => "Molero", "age" => "27"})
    end

    def test_member_has_first_name
        assert_equal("Juan", @member.first_name)
    end

    def test_member_has_last_name
        assert_equal("Molero", @member.last_name)
    end

    def test_member_has_age
        assert_equal("27", @member.age)
    end
  end
