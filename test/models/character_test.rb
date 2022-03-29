require "test_helper"

class CharacterTest < ActiveSupport::TestCase
  test "Constitution, Agility, Self-Discipline, Memory and Reasoning provide development points" do
    c = characters(:auberc)

    assert_respond_to c.constitution, :development_points
    assert_respond_to c.agility, :development_points
    assert_respond_to c.self_discipline, :development_points
    assert_respond_to c.memory, :development_points
    assert_respond_to c.reasoning, :development_points
  end

  test "Strength, Quickness, Presence, Empathy and Intuition don't provide development points" do
    c = characters(:auberc)

    refute_respond_to c.strength, :development_points
    refute_respond_to c.quickness, :development_points
    refute_respond_to c.presence, :development_points
    refute_respond_to c.empathy, :development_points
    refute_respond_to c.intuition, :development_points
  end
end
