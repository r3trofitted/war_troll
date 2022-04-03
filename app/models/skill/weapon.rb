module Skill
  class Weapon < Base
    
    attr_accessor :weapon, :stat, :level_bonus, :object_bonus, :special_bonus_1, :special_bonus_2, :special_bonus_3

    def normal_bonus
      stat.bonus
    end
    
    def total_bonus
      [normal_bonus, level_bonus, rank_bonus, special_bonus_1, special_bonus_2, special_bonus_3].compact.inject(&:+)
    end
    
    def to_partial_path
      "characters/weapon_skill"
    end
  end
end
