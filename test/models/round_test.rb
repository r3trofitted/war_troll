require "test_helper"

class RoundTest < ActiveSupport::TestCase
  test "#actions.of_phase when at phase 'Spell results'" do
    @completed_round.at_phase_spell_results!
    
    actions = @completed_round.actions.of_phase
    
    assert_equal 1, actions.count
    assert_equal @spell_preparation_during_completed_round, actions.first
  end
  
  test "#actions.of_phase when at phase 'Fire results (A)'" do
    @completed_round.at_phase_fire_results_a!
    
    actions = @completed_round.actions.of_phase
    
    assert_equal 1, actions.count
    assert_equal @missile_attack_a_during_completed_round, actions.first
  end
  
  test "#actions.of_phase when at phase 'Fire results (B)'" do
    @completed_round.at_phase_fire_results_b!
    
    actions = @completed_round.actions.of_phase
    
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
