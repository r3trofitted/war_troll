module Races
  Dwarf = Race.new do
    @stat_bonus_modifiers = StatsStruct.new(
      constitution: 15,
      agility: -5
      self_discpline: 5,
      memory: 0,
      reasoning: 0,
      strength: 5,
      quickness: -5,
      presence: -10,
      empathy: -10,
      intuition: 0
    )
    @soul_departure               = 18
    @stat_deterioration           = "-1"
    @recovery_multiplier          = "×0,5"
    @type_of_hit_dice             = "d10"
    @maximum_base_hit_point_total = 120
  end
end
