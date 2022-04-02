require "test_helper"

class Skill::PrimaryTest < ActiveSupport::TestCase
  test "#rank_bonus is -25 if a skill a no rank" do
    assert_equal -25, Skill::Primary.new(ranks: 0).rank_bonus
  end
  
  test "#rank_bonus is 5 par rank up to rank 10" do
    assert_equal  5, Skill::Primary.new(ranks: 1).rank_bonus
    assert_equal 10, Skill::Primary.new(ranks: 2).rank_bonus
    assert_equal 15, Skill::Primary.new(ranks: 3).rank_bonus
    assert_equal 20, Skill::Primary.new(ranks: 4).rank_bonus
    assert_equal 25, Skill::Primary.new(ranks: 5).rank_bonus
    assert_equal 30, Skill::Primary.new(ranks: 6).rank_bonus
    assert_equal 35, Skill::Primary.new(ranks: 7).rank_bonus
    assert_equal 40, Skill::Primary.new(ranks: 8).rank_bonus
    assert_equal 45, Skill::Primary.new(ranks: 9).rank_bonus
    assert_equal 50, Skill::Primary.new(ranks: 10).rank_bonus
  end

  test "#rank_bonus is 2 par rank from rank 11 to rank 20" do
    assert_equal 52, Skill::Primary.new(ranks: 11).rank_bonus
    assert_equal 54, Skill::Primary.new(ranks: 12).rank_bonus
    assert_equal 56, Skill::Primary.new(ranks: 13).rank_bonus
    assert_equal 58, Skill::Primary.new(ranks: 14).rank_bonus
    assert_equal 60, Skill::Primary.new(ranks: 15).rank_bonus
    assert_equal 62, Skill::Primary.new(ranks: 16).rank_bonus
    assert_equal 64, Skill::Primary.new(ranks: 17).rank_bonus
    assert_equal 66, Skill::Primary.new(ranks: 18).rank_bonus
    assert_equal 68, Skill::Primary.new(ranks: 19).rank_bonus
    assert_equal 70, Skill::Primary.new(ranks: 20).rank_bonus
  end

  test "#rank_bonus is 1 par rank from rank 20 to rank 25" do
    assert_equal 71, Skill::Primary.new(ranks: 21).rank_bonus
    assert_equal 72, Skill::Primary.new(ranks: 22).rank_bonus
    assert_equal 73, Skill::Primary.new(ranks: 23).rank_bonus
    assert_equal 74, Skill::Primary.new(ranks: 24).rank_bonus
    assert_equal 75, Skill::Primary.new(ranks: 25).rank_bonus
  end
  
  test "The maximum number of ranks for a skill is 25" do
    skill = Skill::Primary.new(ranks: 26)
    
    skill.validate
    
    refute_empty skill.errors[:ranks]
  end
end
