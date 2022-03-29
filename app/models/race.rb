class Race < Module
  include ActiveModel::Translation
  
  attr_reader :stat_bonus_modifiers
  attr_reader :soul_departure, :stat_deterioration, :recovery_multiplier, :type_of_hit_dice, :maximum_base_hit_point_total

  def stat_bonus_modifiers
    @stat_bonus_modifiers ||= Stat::Struct.with_default(0)
  end

  def rr_bonus_modifiers
    @rr_bonus_modifiers ||= {} # TODO: dedicated struct?
  end
end
