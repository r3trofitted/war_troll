require "test_helper"

class ParticipationTest < ActiveSupport::TestCase
  test "activity_left" do
    participation = Participation.new(base_activity: 100)
    assert_equal 100, participation.activity_left
    
    participation.actions.build activity_cost: 60
    assert_equal 40, participation.activity_left
  end
  
  test "available actions at a given phase" do
    melee_round   = Round.new(phase: :melee)
    participation = Participation.new(round: melee_round)
    
    available_actions = participation.actions.available_for_current_phase
    
    assert_equal 1, available_actions.size
    assert_instance_of MeleeAttack, available_actions.first
  end
  
  test "available actions at a given phase when an action is already declared" do
    melee_round   = Round.create! phase: :melee, combat: @auberc_and_balor_vs_crocodile
    participation = Participation.create! round: melee_round, combatant: @auberc
    participation.actions.create! type: MeleeAttack
    
    available_actions = participation.actions.available_for_current_phase
    
    assert_empty available_actions # a melee action is already declared
  end
end
