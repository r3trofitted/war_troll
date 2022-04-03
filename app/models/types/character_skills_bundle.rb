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
      Skill::Bundle.new(*@skills).tap do |bundle|
        super.each { |name, attrs| bundle[name] = @skill_class.new(attrs) } unless value.nil?
      end
    end
  end
end