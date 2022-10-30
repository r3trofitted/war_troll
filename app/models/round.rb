class Round < ApplicationRecord
  FinishedRoundError = Class.new(StandardError)
  
  PHASES = %i[
    setup
    spell
    spell_results
    spell_orientation
    fire_a
    fire_results_a
    movement_maneuvre
    fire_b
    fire_results_b
    melee
    melee_results
    final_orientation
  ]
    
  belongs_to :combat
  has_many :participations
  has_many :combatants, through: :participations
  
  enum :phase, PHASES, prefix: "at_phase", default: :setup
  
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
  
  def at_action_phase?
    phase.in? %w[spell fire_a fire_b movement_maneuvre melee]
  end
  
  def at_resolution_phase?
    phase.in? %w[spell_results fire_results_a fire_results_b movement_maneuvre melee_results]
  end
  
  def at_orientiation_phase?
    phase.in? %w[spell_orientation final_orientation]
  end
  
  def action_types
    case phase
    when "spell"
      [SpellPreparation, SpellCasting]
    when "fire_a", "fire_b"
      [MissileAttack]
    when "movement_maneuvre"
      [Movement, Maneuvre]
    when "melee"
      [MeleeAttack]
    else
      []
    end
  end
  
  def resolvable_types
    case phase
    when "spell_results"
      [SpellCasting]
    when "fire_results_a", "fire_results_b"
      [MissileAttack]
    when "movement_maneuvre"
      [Movement, Maneuvre]
    when "melee_results"
      [MeleeAttack]
    else
      []
    end
  end
end
