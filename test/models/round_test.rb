require "test_helper"

class RoundTest < ActiveSupport::TestCase
  test "#continue! moves the round to its next phase" do
    round = Round.new(combat: Combat.new, phase: :fire_a)
    round.continue!
    assert round.at_phase_fire_results_a?
  end

  test "#continue! raises an error if the round is at its last phase" do
    round = Round.new(combat: Combat.new, phase: :final_orientation)
    assert_raises(Round::FinishedRoundError) { round.continue! }
  end
  
  test "#next creates a new round" do
    new_round = @auberc_and_balor_vs_crocodile_round_one.next
    
    assert_equal @auberc_and_balor_vs_crocodile, new_round.combat 
    assert_equal 2, new_round.number
    assert_includes new_round.combatants, @auberc
    assert_includes new_round.combatants, @balor
    assert_includes new_round.combatants, @crocodile
  end
end
