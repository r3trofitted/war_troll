class MissileAttack < ApplicationRecord
  include Actionable
  
  @activity = 50
  
  belongs_to :target, class_name: "Combatant"
  
  validates_inclusion_of :phase, in: ["A", "B"]
end
