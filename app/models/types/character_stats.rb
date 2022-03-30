module Types
  class CharacterStats < ActiveRecord::Type::Json
    def deserialize(value)
      StatsStruct.new(super)
    end
  end
end
