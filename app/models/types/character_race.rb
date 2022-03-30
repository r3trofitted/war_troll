module Types
  class CharacterRace < ActiveRecord::Type::Value
    def cast(value)
      if value.nil? || value.kind_of?(Race)
        super
      else
        Races.const_get value.to_s.camelize
      end
    end

    def serialize(value)
      if value.kind_of? Race
        super(value.name.demodulize.underscore)
      else
        super
      end
    end
  end
end
