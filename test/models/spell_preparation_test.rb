require "test_helper"

class SpellPreparationTest < ActiveSupport::TestCase
  test "a spell preparation takes 90% activity" do
    assert_equal 90, SpellPreparation.activity
  end
end
