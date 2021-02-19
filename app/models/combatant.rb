class Combatant < ApplicationRecord
  has_many :participations
  delegated_type :combatable, types: %w(Character Creature)
  delegate :name, to: :combatable
end
