class Combatant < ApplicationRecord
  has_many :participations
  delegated_type :combatable, types: %w(Character Creature)
end
