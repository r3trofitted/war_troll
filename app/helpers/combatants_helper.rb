module CombatantsHelper
  def hit_points_counter(combatant)
    "%d / %d" % [combatant.current_hit_points, combatant.base_hit_points]
  end
end
