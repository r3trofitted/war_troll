module Skill
  class Primary < Base
    
    attr_accessor :stat, :object_bonus, :special_bonus_1, :special_bonus_2, :special_bonus_3

    def normal_bonus
      stat.bonus
    end
    
    def total_bonus
      [normal_bonus, rank_bonus, special_bonus_1, special_bonus_2, special_bonus_3].compact.inject(&:+)
    end
  end
end
