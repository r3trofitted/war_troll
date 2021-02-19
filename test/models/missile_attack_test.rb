require "test_helper"

class MissileAttackPreparationTest < ActiveSupport::TestCase
  test "a missile attack takes 50% activity" do
    assert_equal 50, MissileAttack.activity
  end
end
