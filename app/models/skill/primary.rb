module Skill
  class Primary
    include ActiveModel::Model
    
    attr_accessor :stat, :development_cost, :ranks, :object_bonus, :special_bonus_1, :special_bonus_2, :special_bonus_3
    
    validates :ranks, inclusion: { in: 0..25 }

    def normal_bonus
      stat.bonus
    end
    
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
      [normal_bonus, rank_bonus, special_bonus_3].compact.inject(&:+) # FIXME: slime!
    end
    alias_method :bonus, :total_bonus
    
    def to_partial_path
      "characters/skill"
    end
  end
end
