class Combatant < ApplicationRecord
  has_many :participations
  
  validates_presence_of :name, :base_hit_points
  
  def current_hit_points
    base_hit_points # SLIME
  end
  alias_method :hit_points, :current_hit_points
end
