require "#{Rails.root}/app/models/types/character_race"

ActiveRecord::Type.register(:character_race, Types::CharacterRace)
