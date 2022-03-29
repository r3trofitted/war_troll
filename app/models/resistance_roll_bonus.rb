class ResistanceRollBonus
  extend ActiveModel::Naming

  attr_reader :stat, :race_bonus, :special_bonus

  def initialize(stat, race_bonus = nil, special_bonus = nil)
    @stat, @race_bonus, @special_bonus = stat, race_bonus, special_bonus
  end

  def normal_bonus
    stat.bonus
  end

  def total_bonus
    [normal_bonus, @race_bonus, @special_bonus].compact.inject(&:+) # Using `#inject` because, per the documentation, ‘Array#sum method may not respect method redefinition of “+”’
  end

  def to_partial_path
    "characters/rr"
  end
end
