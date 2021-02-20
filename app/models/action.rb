class Action < ApplicationRecord
  belongs_to :participation, touch: true
  has_one :combatant, through: :participation
  has_one :round, through: :participation
  
  delegated_type :actionable, types: %w(SpellPreparation MissileAttack), dependent: :destroy, validate: true
  
  delegate :name, to: :combatant, prefix: true
  
  before_save :set_activity
  
  validates_associated :actionable
  
  def resolved?
    actionable.try(:result?)
  end

  def unresolved?
    not resolved?
  end
  
  private
  
  def set_activity
    self.activity ||= actionable_class.activity
  end
end
