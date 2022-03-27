class DefensiveBonus
  extend ActiveModel::Translation, ActiveModel::Naming

  def initialize(bonus)
    @bonus = bonus
  end

  # FIXME: this method should not do 2 things at once, computing the total bonus **AND** formatting it
  def normal_bonus
    '%+d' % @bonus
  end

  def object_bonus
    # TODO
  end

  def special_bonus
    # TODO
  end
  
# FIXME: this should actually be the sum of the normal, object and special bonuses
  def total_bonus
    normal_bonus
  end

  def to_partial_path
    "characters/db"
  end
end
