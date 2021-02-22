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
  has_many :actions, through: :participations do
    def of_phase
      case proxy_association.owner.phase
      when SPELL_RESULTS
        spell_preparations
      when FIRE_RESULTS_A
        missile_attacks.where(actionable_id: MissileAttack.where(phase: "A").select(:id))
      when FIRE_RESULTS_B
        missile_attacks.where(actionable_id: MissileAttack.where(phase: "B").select(:id))
      else
        none
      end
    end
  end
  
  enum phase: PHASES, _default: SETUP, _prefix: :at_phase
  
  def continue!
    raise FinishedRoundError if finished?
    
    send "at_phase_#{next_phase}!"
  end
  
  def resolutions
    actions.of_phase.map { |a| Resolution.for(a) }
  end
  
  private
  
  def next_phase
    PHASES.at(Round.phases[phase] + 1)
  end
  
  def finished?
    at_phase_final_orientation?
  end
end
