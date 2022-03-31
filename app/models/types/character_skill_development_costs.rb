module Types
  class CharacterSkillDevelopmentCosts < ActiveRecord::Type::Json 
    def deserialize(value)
      Skill::DevelopmentCosts.new(**super)
    end
  end
end
