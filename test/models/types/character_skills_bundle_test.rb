require "test_helper"

class Types::CharacterSkillsBundleTest < ActiveSupport::TestCase
  RAW_DB_VALUE = <<~JSON
    {
      "chain": {
        "ranks": 10,
        "development_cost": "3/*"
      },
      "plate": {
        "ranks": 8,
        "development_cost": "4/*"
      }
    }
  JSON
  
  def setup
    @type = Types::CharacterSkillsBundle.new skill_class: Skill::ManeuveringInArmor, skills: %i(chain plate)
  end
  
  test "when deserializing, the ranks and development cost are set" do
    bundle = @type.deserialize(RAW_DB_VALUE)
    
    assert_equal 10, bundle.chain.ranks
    assert_equal "3/*", bundle.chain.development_cost
    assert_equal 8, bundle.plate.ranks
    assert_equal "4/*", bundle.plate.development_cost
  end
  
  test "when deserializing, the :skill_class option is used to cast the individual skills from the bundle" do
    bundle = @type.deserialize(RAW_DB_VALUE)
    
    bundle.each do |skill|
      assert_kind_of Skill::ManeuveringInArmor, skill
    end
  end
  
  test "when serializing, only the ranks and development costs of the skills are stored" do
    bundle = Skill::Bundle.new(:chain).tap do |b|
      b.chain = Skill::ManeuveringInArmor.new(ranks: 10, development_cost: "3/*", object_bonus: Bonus.new(10))
    end
    
    data = @type.serialize(bundle)
    
    assert_match %r{"ranks":10}, data
    assert_match %r{"development_cost":"3/\*"}, data
    refute_match %r{"object_bonus"}, data
  end
  
  test "when serializing, blank skills from the bundle are ignored" do
    bundle = Skill::Bundle.new(:chain).tap do |b|
      b.chain = nil
    end
    
    data = @type.serialize(bundle)
    
    refute_match %r{"chain"}, data
  end
end
