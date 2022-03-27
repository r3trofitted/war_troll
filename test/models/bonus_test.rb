require "test_helper"

class BonusTest < ActiveSupport::TestCase
  test "#to_s adds a plus or minus sign" do
    assert_equal "+10", Bonus.new(10).to_s
    assert_equal "-20", Bonus.new(-20).to_s
    assert_equal "0", Bonus.new(0).to_s
  end
  
  test "a bonus can be compared to another bonus" do
    assert Bonus.new(10) > Bonus.new(5)
    assert Bonus.new(10) < Bonus.new(20)
    assert Bonus.new(20) == Bonus.new(20)
  end
  
  test "a bonus can be compared to a number" do
    assert Bonus.new(10) > 5
    assert Bonus.new(10) < 20
    assert Bonus.new(20) == 20
  end
  
  test "a number can be compared to a bonus" do
    assert 10 > Bonus.new(5)
    assert 10 < Bonus.new(20)
    assert 20 == Bonus.new(20)
  end
  
  test "bonuses can be added" do
    sum = Bonus.new(5) + Bonus.new(5)
    
    assert_kind_of Bonus, sum
    assert_equal 10, sum.value
  end
  
  test "a number can be added to a bonus" do
    sum = Bonus.new(10) + 5
    
    assert_kind_of Bonus, sum
    assert_equal 15, sum.value
  end
  
  test "a bonus can be added to a number" do
    sum = 10 + Bonus.new(20)
    
    assert_kind_of Numeric, sum
    assert_equal 30, sum
  end
  
  test "bonuses can be substracted" do
    sum = Bonus.new(15) - Bonus.new(5)
    
    assert_kind_of Bonus, sum
    assert_equal 10, sum.value
  end
  
  test "a number can be substracted from a bonus" do
    sum = Bonus.new(0) - 5
    
    assert_kind_of Bonus, sum
    assert_equal -5, sum.value
  end
  
  test "a bonus can be substracted from a number" do
    sum = 10 - Bonus.new(20)
    
    assert_kind_of Numeric, sum
    assert_equal -10, sum
  end
  
  test "a bonus can be multiplied by a number" do
    total = Bonus.new(15) * 3
    
    assert_kind_of Bonus, total
    assert_equal 45, total.value
  end
  
  test "a number can be multiplied by a bonus" do
    total = 2 * Bonus.new(-5)
    
    assert_kind_of Numeric, total
    assert_equal -10, total
  end
  
  test "a bonus can be divided number" do
    total = Bonus.new(15) / 3
    
    assert_kind_of Bonus, total
    assert_equal 5, total.value
  end
  
  test "a number can be divided by a bonus" do
    total = 20 / Bonus.new(-10)
    
    assert_kind_of Numeric, total
    assert_equal -2, total
  end
end
