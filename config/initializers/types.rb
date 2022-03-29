require "#{Rails.root}/app/models/types/character_stats"
require "#{Rails.root}/app/models/types/character_race"

ActiveRecord::Type.register(:character_stats, Types::CharacterStats)
ActiveRecord::Type.register(:character_race, Types::CharacterRace)
