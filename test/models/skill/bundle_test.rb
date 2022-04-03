require "test_helper"

class Skill::BundleTest < ActiveSupport::TestCase
  test "a bundle acts like a struct" do
    bundle = Skill::Bundle.new(:a_skill, :another_skill)
    
    assert_respond_to bundle, :a_skill
    assert_respond_to bundle, :another_skill
  end
end
