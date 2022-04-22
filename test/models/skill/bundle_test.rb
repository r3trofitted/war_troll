require "test_helper"

class Skill::BundleTest < ActiveSupport::TestCase
  test "a bundle acts like a struct" do
    bundle = Skill::Bundle.new(:a_skill, :another_skill, klass: Object)
    
    assert_respond_to bundle, :a_skill
    assert_respond_to bundle, :another_skill
  end
  
  test "a bundle initializes defaut values for each of its members" do
    klass = Class.new
    bundle = Skill::Bundle.new(:foo, klass: klass)
    
    assert_kind_of klass, bundle.foo
  end
end
