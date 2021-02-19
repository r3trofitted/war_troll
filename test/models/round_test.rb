require "test_helper"

class RoundTest < ActiveSupport::TestCase
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
