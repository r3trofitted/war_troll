require "test_helper"

class Types::CharacterSkillsBundleTest < ActiveSupport::TestCase
  RAW_DB_VALUE = <<~JSON
    {
      "cooking": {
        "ranks": 10,
        "development_cost": "3/*"
      },
      "juggling": {
        "ranks": 8,
        "development_cost": "4/*"
      }
    }
  JSON
  
  def setup
    @type = Types::CharacterSkillsBundle.new skills: %i(cooking juggling), skill_class: Skill::Base
  end
  
  test "when deserializing, each skill in the bundle is of the right class and its ranks and development cost are set" do
    bundle = @type.deserialize(RAW_DB_VALUE)
    
    assert_kind_of Skill::Bundle, bundle
    
    assert_kind_of Skill::Base, bundle.cooking
    assert_equal 10, bundle.cooking.ranks
    assert_equal "3/*", bundle.cooking.development_cost
    
    assert_kind_of Skill::Base, bundle.juggling
    assert_equal 8, bundle.juggling.ranks
    assert_equal "4/*", bundle.juggling.development_cost
  end
  
  test "when deserializing, NULL data is cast to an empty but valid bundle" do
    bundle= @type.deserialize(nil)
    
    assert_kind_of Skill::Bundle, bundle
    
    assert_kind_of Skill::Base, bundle.cooking
    assert_equal 0, bundle.cooking.ranks
    assert_nil bundle.cooking.development_cost
    
    assert_kind_of Skill::Base, bundle.juggling
    assert_equal 0, bundle.juggling.ranks
    assert_nil bundle.juggling.development_cost
  end
  
  test "when serializing, only the ranks and development costs of the skills are stored" do
    bundle = Skill::Bundle.new(:cooking, klass: Skill::Base).tap do |b|
      b.cooking = Skill::Base.new(ranks: 10, development_cost: "3/*", special_bonus_1: Bonus.new(10))
    end
    
    data = @type.serialize(bundle)
    
    assert_match %r{"ranks":10}, data
    assert_match %r{"development_cost":"3/\*"}, data
    refute_match %r{"special_bonus"}, data
  end
  
  test "when serializing, blank skills from the bundle are ignored" do
    bundle = Skill::Bundle.new(:cooking, klass: Skill::Base).tap do |b|
      b.cooking = nil
    end
    
    data = @type.serialize(bundle)
    
    refute_match %r{"cooking"}, data
  end
end
