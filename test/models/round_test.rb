require "test_helper"

class RoundTest < ActiveSupport::TestCase
  test "#actions.at_phase when at phase 'Spell results'" do
    actions = @completed_round.actions.at_phase(Round::SPELL_RESULTS)
    
    assert_equal 1, actions.count
    assert_equal @spell_preparation_during_completed_round, actions.first
  end
  
  test "#actions.at_phase when at phase 'Fire results (A)'" do
    actions = @completed_round.actions.at_phase(Round::FIRE_RESULTS_A)
    
    assert_equal 1, actions.count
    assert_equal @missile_attack_a_during_completed_round, actions.first
  end
  
  test "#actions.at_phase when at phase 'Fire results (B)'" do
    actions = @completed_round.actions.at_phase(Round::FIRE_RESULTS_B)
    
    assert_equal 1, actions.count
    assert_equal @missile_attack_b_during_completed_round, actions.first
  end
  
  test "#continue! moves the round to its next phase" do
    round = Round.new(combat: Combat.new, phase: Round::FIRE_A)
    round.continue!
    assert_equal Round::FIRE_RESULTS_A, round.phase
  end
  
  test "#continue! raises an error if the round is at its last phase" do
    round = Round.new(combat: Combat.new, phase: Round::FINAL_ORIENTATION)
    assert_raises(Round::FinishedRoundError) { round.continue! }
  end
end
