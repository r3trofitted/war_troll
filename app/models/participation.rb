class Participation < ApplicationRecord
  belongs_to :round
  belongs_to :combatant
  has_many :actions
  
  def activity_left
    base_activity - actions.sum(&:activity)
  end
end
