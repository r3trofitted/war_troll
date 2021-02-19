class Round < ApplicationRecord
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
  
  enum phase: PHASES, _default: SETUP, _prefix: :at_phase
end
