require "#{Rails.root}/app/models/types/character_stats"
require "#{Rails.root}/app/models/types/character_race"
require "#{Rails.root}/app/models/types/character_skill_development_costs"

ActiveRecord::Type.register(:character_stats, Types::CharacterStats)
ActiveRecord::Type.register(:character_race, Types::CharacterRace)
ActiveRecord::Type.register(:character_skill_development_costs, Types::CharacterSkillDevelopmentCosts)
