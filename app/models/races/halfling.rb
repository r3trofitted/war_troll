module Races
  Halfling = Race.new do
    @stat_bonus_modifiers = StatsStruct.new(
      constitution: 15,
      agility: 15,
      self_discpline: -10,
      memory: 0,
      reasoning: 0,
      strength: -20,
      quickness: +10,
      presence: -15,
      empathy: -5,
      intuition: 0
    )
    @soul_departure               = 18
    @stat_deterioration           = -1
    @recovery_multiplier          = "×0,5"
    @type_of_hit_dice             = "d8"
    @maximum_base_hit_point_total = 80
  end
end
