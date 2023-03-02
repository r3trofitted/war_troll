class Participation < ApplicationRecord
  belongs_to :round
  belongs_to :combatant
  
  accepts_nested_attributes_for :combatant, reject_if: :all_blank
  
  validates_presence_of :base_activity, :round, :combatant
  
  delegate :name, to: :combatant, prefix: true
  
  def activity_left
    base_activity # SLIME
  end
end
