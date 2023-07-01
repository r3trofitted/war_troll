require "test_helper"

class ActionTest < ActiveSupport::TestCase
  test "default activity_cost" do
    action_class = Class.new(Action) { self.base_activity_cost = 66 }
    action = action_class.new
    assert_equal 66, action.activity_cost
  end
  
  test "default activity_cost when base_activity_cost is a range" do
    action_class = Class.new(Action) { self.base_activity_cost = 13..37 }
    action = action_class.new
    assert_equal 37, action.activity_cost, "the default should be the max value of the range"
  end
  
  test "actions are allowed if their participation has enough activity left" do
    ActionClass = Class.new(Action) { self.base_activity_cost = 60 } # Must use a named class to persist its instances
    
    action = ActionClass.new(participation: @auberc_in_auberc_and_balor_vs_crocodile_round_one)
    assert action.allowed?
    refute action.disallowed?
    
    action.save!
    @auberc_in_auberc_and_balor_vs_crocodile_round_one.actions.reload # only 40% activity left
    
    refute action.allowed?
    assert action.disallowed?
    
    # Cleaning up
    ActionTest.send :remove_const, :ActionClass
  end
end
