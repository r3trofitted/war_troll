require "application_system_test_case"

class CombatRoundsTest < ApplicationSystemTestCase
  test "Auberc and Balor versus the crocodile, round 1 (GM point of view)" do
    visit "/combats/#{@auberc_and_balor_vs_crocodile.id}/round-1"
  
    assert_text "Combat ##{@auberc_and_balor_vs_crocodile.id}"
    assert_text "Round 1"
  
    # 1. Phase 1: Spell
    assert_current_phase "Spell"
    @balor_in_auberc_and_balor_vs_crocodile_round_one.actions.create actionable: SpellPreparation.new(spell: "Sleep V")
    assert_text "Balor prepares a spell (Sleep V)"
    assert_text "10% activity left"
    click_on "Next phase"
  
    # 2. Phase 2: Spell results
    assert_current_phase "Spell Results"
    click_on "Next phase"
    
    # 3. Phase 3: Spell Orientation
    assert_current_phase "Spell Orientation"
    click_on "Next phase"
    
    # 4. Phase 4: Fire (A)
    assert_current_phase "Fire (A)"
    @auberc_in_auberc_and_balor_vs_crocodile_round_one.actions.create actionable: MissileAttack.new(phase: "A", weapon: "spear", target: @crocodile)
    assert_text "Auberc makes a missile attack (spear)"
    assert_text "50% activity left"
    click_on "Next phase"
    
    # 5. Phase 5: Fire Results (A)
    assert_current_phase "Fire Results (A)"
    fill_in "Auberc's attack roll", with: "67"
    click_on "Resolve"
    assert_text "Auberc inflicts 8 hits"
    assert_text "Crocodile #1 has 72 hits left"
    click_on "Next phase"
    
    # 6. Phase 6: Movement/Maneuver
    # assert_current_phase "Movement/Maneuver"
    # @auberc_in_auberc_and_balor_vs_crocodile_round_one.actions.create actionable: StaticManeuvre.new(description: "draws his sword", activity: 20)
    # assert_text "Auberc draws his sword"
    # @auberc_in_auberc_and_balor_vs_crocodile_round_one.actions.create actionable: Movement.new(activity: 30)
    # assert_text "Auberc moves (30%)"
    # assert_text "Auberc has 0% activity left"
    # @balor_in_auberc_and_balor_vs_crocodile_round_one.actions.create actionable: Movement.new(activity: 10)
    # assert_text "Balor moves (10%)"
    # assert_text "Balor has 0% activity left"
    # within_fieldset("Crocodile #1") { select "50%", from: "movement" }
    # assert_text "The crocodile has 50% activity left"
    
    # 7. Phase 7: Fire (B)
    # assert_current_phase "Fire (B)"
    # click_on "Next phase"
    
    # 8. Phase 8: Fire results (B)
    # assert_current_phase "Fire Results (B)"
    # click_on "Next phase"
    
    # 9. Phase 9: Melee
    # assert_current_phase "Melee"
    # within_fieldset("Crocodile #1") do
    #   click_on "Bite (Medium)"
    #   click_on "Auberc"
    #   fill_in "OB/DB split", with: "100"
    #   assert_text "OB +60"
    #   assert_text "DB +60"
    #   click_on "Confirm"
    #   assert_text "Crocodile #1 attacks Auberc with Bite (Medium)"
    # end
    # click_on "Next phase"
    
    # 10. Phase 10: Melee Results
    # assert_current_phase "Melee results"
    # within_fieldset("Crocodile #1") do
    #   fill_in "Attack roll", with: "93"
    #   assert_text "Crocodile #1 inflicts 4 hits"
    #   assert_text "Auberc down to 23 hit points"
    # end
    # click_on "Next phase"
    
    # 11. Phase 11: Final Orientation
    # assert_current_phase "Final Orientation"
    # click_on "End round"
  end
  
  private
  
  def assert_current_phase(phase)
    within "#phases-tracker" do
      assert_selector "li", text: phase, class: "current-phase"
    end
  end
end
