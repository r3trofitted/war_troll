require "test_helper"

class Skill::ManeuveringInArmorTest < ActiveSupport::TestCase
  test "#rank_bonus is -25 if a skill a no rank" do
    assert_equal -25, Skill::ManeuveringInArmor.new(ranks: 0).rank_bonus
  end
  
  test "#rank_bonus is 5 par rank up to rank 25" do
    assert_equal   5, Skill::ManeuveringInArmor.new(ranks: 1).rank_bonus
    assert_equal  10, Skill::ManeuveringInArmor.new(ranks: 2).rank_bonus
    assert_equal  15, Skill::ManeuveringInArmor.new(ranks: 3).rank_bonus
    assert_equal  20, Skill::ManeuveringInArmor.new(ranks: 4).rank_bonus
    assert_equal  25, Skill::ManeuveringInArmor.new(ranks: 5).rank_bonus
    assert_equal  30, Skill::ManeuveringInArmor.new(ranks: 6).rank_bonus
    assert_equal  35, Skill::ManeuveringInArmor.new(ranks: 7).rank_bonus
    assert_equal  40, Skill::ManeuveringInArmor.new(ranks: 8).rank_bonus
    assert_equal  45, Skill::ManeuveringInArmor.new(ranks: 9).rank_bonus
    assert_equal  50, Skill::ManeuveringInArmor.new(ranks: 10).rank_bonus
    assert_equal  55, Skill::ManeuveringInArmor.new(ranks: 11).rank_bonus
    assert_equal  60, Skill::ManeuveringInArmor.new(ranks: 12).rank_bonus
    assert_equal  65, Skill::ManeuveringInArmor.new(ranks: 13).rank_bonus
    assert_equal  70, Skill::ManeuveringInArmor.new(ranks: 14).rank_bonus
    assert_equal  75, Skill::ManeuveringInArmor.new(ranks: 15).rank_bonus
    assert_equal  80, Skill::ManeuveringInArmor.new(ranks: 16).rank_bonus
    assert_equal  85, Skill::ManeuveringInArmor.new(ranks: 17).rank_bonus
    assert_equal  90, Skill::ManeuveringInArmor.new(ranks: 18).rank_bonus
    assert_equal  95, Skill::ManeuveringInArmor.new(ranks: 19).rank_bonus
    assert_equal 100, Skill::ManeuveringInArmor.new(ranks: 20).rank_bonus
    assert_equal 105, Skill::ManeuveringInArmor.new(ranks: 21).rank_bonus
    assert_equal 110, Skill::ManeuveringInArmor.new(ranks: 22).rank_bonus
    assert_equal 115, Skill::ManeuveringInArmor.new(ranks: 23).rank_bonus
    assert_equal 120, Skill::ManeuveringInArmor.new(ranks: 24).rank_bonus
    assert_equal 125, Skill::ManeuveringInArmor.new(ranks: 25).rank_bonus
  end
  
  test "The maximum number of ranks for a skill is 25" do
    skill = Skill::ManeuveringInArmor.new(ranks: 26)
    
    skill.validate
    
    refute_empty skill.errors[:ranks]
  end
end
