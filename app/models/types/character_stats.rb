module Types
  class CharacterStats < ActiveRecord::Type::Json
    def deserialize(value)
      Stat::Struct.new(super)
    end
  end
end
