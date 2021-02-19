class Participation < ApplicationRecord
  belongs_to :round
  belongs_to :combatant
  has_many :actions
end
