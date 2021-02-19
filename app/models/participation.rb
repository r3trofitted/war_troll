class Participation < ApplicationRecord
  belongs_to :round
  belongs_to :combatant
  has_many :actions
  
  broadcasts_to ->(participation) { [participation.round, :participations] }
  
  def activity_left
    base_activity - actions.sum(&:activity)
  end
end
