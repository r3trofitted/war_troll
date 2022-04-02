module Skill
  class Base
    include ActiveModel::Model
    
    attr_accessor :development_cost, :ranks, :special_bonus_1, :special_bonus_2, :special_bonus_3
    
    validates :ranks, inclusion: { in: 0..25 }
    
    def special?
      false
    end
    
    def rank_bonus
      return Bonus.new(-25) if ranks.zero?
      
      full_groups, remaining_ranks = ranks.divmod(10)
      case full_groups
      when 2 then Bonus.new(70 + remaining_ranks * 1)
      when 1 then Bonus.new(50 + remaining_ranks * 2)
      when 0 then Bonus.new(remaining_ranks * 5)
      end
    end
    
    def total_bonus
      rank_bonus
    end
    alias_method :bonus, :total_bonus
    
    def to_partial_path
      "characters/skill"
    end
  end
end
