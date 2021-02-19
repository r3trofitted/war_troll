class Action < ApplicationRecord
  belongs_to :participation, touch: true
  has_one :combatant, through: :participation
  has_one :round, through: :participation
end
