class Character < ApplicationRecord
  enum :gender, %i(male female), default: :male
  enum :maximum_pace, %i(walk fast_walk run sprint fast_sprint dash), default: :dash
  
  concerning :Race do
    included do
      attribute :race, :character_race

      delegate :stat_bonus_modifiers, :rr_bonus_modifiers, :soul_departure, :stat_deterioration, :recovery_multiplier, :type_of_hit_dice, :maximum_base_hit_point_total,
                to: :race
    end
  end
  
  concerning :Skills do
    included do
      attribute :skill_development_costs, :character_skill_development_costs, default: Skill::DevelopmentCosts.new
      attribute :maneuvering_in_armor_skills, :character_skills_bundle, skill_class: Skill::ManeuveringInArmor, skills: Skill::MANEUVERING_IN_ARMOR
    end
    
    # FIXME: slime!
    def skills
      OpenStruct.new({
        perception: Skill::Primary.new(stat: intuition, development_cost: "2/5", ranks: 4)
      })
    end
    
    # FIXME: slime!
    def weapon_skills
      [
        Skill::Weapon.new(stat: strength, development_cost: "1/5", ranks: 6, level_bonus: Bonus.new(9), weapon: :two_handed_sword)
      ]
    end
  end

  concerning :Stats do
    included do
      attribute :stats, :character_stats, default: Stat::Struct.new
    end
    
    def constitution; dev_stat(:constitution); end
    def agility; dev_stat(:agility); end
    def self_discipline; dev_stat(:self_discipline); end
    def memory; dev_stat(:memory); end
    def reasoning; dev_stat(:reasoning); end
    def strength; primary_stat(:strength); end
    def quickness; primary_stat(:quickness); end
    def presence; primary_stat(:presence); end
    def empathy; primary_stat(:empathy); end
    def intuition; primary_stat(:intuition); end

    private

    def dev_stat(s)
      if (temporary, potential = stats[s])
        Stat::Development.new temporary, potential, stat_bonus_modifiers[s], Character.human_attribute_name(s), Character.human_attribute_name("abbreviations.#{s}")
      end
    end

    def primary_stat(s)
      if (temporary, potential = stats[s])
        Stat::Primary.new temporary, potential, stat_bonus_modifiers[s], Character.human_attribute_name(s), Character.human_attribute_name("abbreviations.#{s}")
      end
    end
  end

  concerning :ResistanceRolls do
    def rr_bonus_against_poison
      ResistanceRollBonus.new constitution, rr_bonus_modifiers[:poison]
    end

    def rr_bonus_against_disease
      ResistanceRollBonus.new constitution, rr_bonus_modifiers[:disease]
    end
    def rr_bonus_against_mentalism
      ResistanceRollBonus.new presence, rr_bonus_modifiers[:mentalism]
    end
    def rr_bonus_against_essence
      ResistanceRollBonus.new empathy, rr_bonus_modifiers[:essence]
    end
    def rr_bonus_against_channeling
      ResistanceRollBonus.new intuition, rr_bonus_modifiers[:channeling]
    end
  end

  def defensive_bonus
    DefensiveBonus.new(quickness.bonus)
  end
  alias_method :db, :defensive_bonus
end
