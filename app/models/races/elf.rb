module Races
  Elf = Race.new do
    @stat_bonus_modifiers = StatsStruct.new(
      constitution: 0,
      agility: 5,
      self_discipline: -20,
      memory: 5,
      reasoning: 0,
      strength: 0,
      quickness: 15,
      presence: 15,
      empathy: 5,
      intuition: 0
    )
    @soul_departure               = 1
    @stat_deterioration           = "+6"
    @recovery_multiplier          = "×3"
    @type_of_hit_dice             = "d10"
    @maximum_base_hit_point_total = 120
  end
end
