class Round < ApplicationRecord
  FinishedRoundError = Class.new(StandardError)
  
  PHASES = [
    SETUP             = "setup",
    SPELL             = "spell",
    SPELL_RESULTS     = "spell_results",
    SPELL_ORIENTATION = "spell_orientation",
    FIRE_A            = "fire_a",
    FIRE_RESULTS_A    = "fire_results_a",
    MOVEMENT_MANEUVRE = "movement_maneuvre",
    FIRE_B            = "fire_b",
    FIRE_RESULTS_B    = "fire_results_b",
    MELEE             = "melee",
    MELEE_RESULTS     = "melee_results",
    FINAL_ORIENTATION = "final_orientation"
  ]
    
  belongs_to :combat
  has_many :participations
  has_many :combatants, through: :participations
  
  enum :phase, PHASES, prefix: "at_phase", default: SETUP
  
  def next_phase
    PHASES.at(Round.phases[phase] + 1)
  end
  
  def continue!
    raise FinishedRoundError if finished?

    send "at_phase_#{next_phase}!"
  end
  
  def finished?
    at_phase_final_orientation?
  end
  
  def next
    Round.create combat_id: combat_id, combatants: combatants, number: number + 1
  end
end
