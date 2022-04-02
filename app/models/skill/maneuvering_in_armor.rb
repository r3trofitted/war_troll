module Skill
  class ManeuveringInArmor < Base
    
    attr_accessor :development_cost, :object_bonus
    
    def special?
      true
    end
    
    # TODO: the effective ranks limit should depend on the armor worn (TA 3, 4, etc.)
    def rank_bonus
      if ranks.zero?
        Bonus.new(-25)
      else
        Bonus.new(ranks * 5)
      end
    end
    
    def total_bonus
      [rank_bonus, object_bonus, special_bonus_1, special_bonus_2, special_bonus_3].compact.inject(&:+)
    end
  end
end
