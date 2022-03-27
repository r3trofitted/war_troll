class DefensiveBonus
  extend ActiveModel::Translation, ActiveModel::Naming

  def initialize(bonus)
    @bonus = bonus
  end

  def normal_bonus
    @bonus
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
