class Action < ApplicationRecord
  belongs_to :participation, touch: true
  has_one :combatant, through: :participation
  has_one :round, through: :participation
  
  delegated_type :actionable, types: %w(SpellPreparation MissileAttack), dependent: :destroy, validate: true
  
  validates_associated :actionable
end
