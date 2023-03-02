class RoundsHelperTest < ActionView::TestCase
  test "#vanity_combat_id returns the round's :combat_id, padded with zeroes to look more impressive" do
    dull_round = Round.new(combat_id: 7)
    assert_equal "007", vanity_combat_id(dull_round)
    
    impressive_round = Round.new(combat_id: 1337)
    assert_equal "1337", vanity_combat_id(impressive_round)
  end
end
