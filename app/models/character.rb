class Character < ApplicationRecord
  enum :gender, %i(male female), default: :male
  enum :maximum_pace, %i(walk fast_walk run sprint fast_sprint dash), default: :dash
  
  STATS = %i(constitution agility self_discipline memory reasoning strength quickness presence empathy intuition)

  concerning :Race do
    included do
      attribute :race, :character_race

      delegate :stat_bonus_modifiers, :soul_departure, :stat_deterioration, :recovery_multiplier, :type_of_hit_dice, :maximum_base_hit_point_total,
                to: :race
    end
  end
end
