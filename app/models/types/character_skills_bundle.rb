module Types
  class CharacterSkillsBundle < ActiveRecord::Type::Json
    def initialize(skill_class:, skills:, **kwargs)
      @skill_class = skill_class
      @skills = skills
      super(**kwargs)
    end
    
    def serialize(value)
      unless value.nil?
        super value.to_h.compact_blank.transform_values { |skill| { ranks: skill.ranks, development_cost: skill.development_cost } }
      end
    end
    
    def deserialize(value)
      Skill::Bundle.new(*@skills, klass: @skill_class).tap do |bundle|
        Hash(super).each { |name, attrs| bundle[name] = @skill_class.new(attrs) }
      end
    end
  end
end
