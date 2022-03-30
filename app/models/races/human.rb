module Races
  Human = Race.new do
    @stat_bonus_modifiers = StatsStruct.new(
      constitution: 0,
      agility: 0,
      self_discipline: 5,
      memory: 0,
      reasoning: 0,
      strength: 5,
      quickness: 0,
      presence: 0,
      empathy: 0,
      intuition: 0
    )
    @soul_departure               = 12
    @stat_deterioration           = 0
    @recovery_multiplier          = "×1"
    @type_of_hit_dice             = "d8"
    @maximum_base_hit_point_total = 120
  end
end
