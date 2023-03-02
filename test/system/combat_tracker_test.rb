require "application_system_test_case"

class CombatTrackerTest < ApplicationSystemTestCase
  PRETTY_COMBAT_ROUND_URL_PATTERN = %r|combats/(\d+)/round-(\d+)|
  
  test "tracking a new combat, from the GM's perspective" do
    visit home_url

    click_on "New combat"
    
    assert_current_path PRETTY_COMBAT_ROUND_URL_PATTERN # unfortunately, Capybara assertions don't extract matched regexp fields
    _, combat_id, _round_number = *PRETTY_COMBAT_ROUND_URL_PATTERN.match(current_path) # extracting matched fields (see https://ruby-doc.org/core-3.1.2/MatchData.html#to_a-method)
    
    assert_content "Combat ##{combat_id}"
    assert_content "Round 1"
    
    # Setup
    assert_content "Current phase: setup"
    
    click_on "Add a combatant"
    fill_in "Name", with: "Auberc"
    fill_in "Hit points", with: "50"
    click_on "Add"
    
    click_on "Add a combatant"
    fill_in "Name", with: "Balor"
    fill_in "Hit points", with: "60"
    click_on "Add"
    
    click_on "Add a combatant"
    fill_in "Name", with: "Crocodile #1"
    fill_in "Hit points", with: "80"
    click_on "Add"
    
    click_on "Move to next phase (spell)"
    
    # Spell
    within "#combatants" do
      assert_content "Auberc"
      assert_content "Balor"
      assert_content "Crocodile #1"
    refute_content "Add a combatant"
    end
    
    click_on "Move to next phase (spell results)"
    
    # Spell results
    # TODO
    click_on "Move to next phase (spell orientation)"
    
    # Spell orientation
    # TODO
    click_on "Move to next phase (fire (A))"

    # Fire (A)
    # TODO
    click_on "Move to next phase (fire results (A))"

    # Fire resuls (A)
    # TODO
    click_on "Move to next phase (movement/maneuver)"

    # Movement.maneuvre
    # TODO
    click_on "Move to next phase (fire (B))"

    # Fire (B)
    # TODO
    click_on "Move to next phase (fire results (B))"

    # Fire results (B)
    # TODO
    click_on "Move to next phase (melee)"

    # Melee
    # TODO
    click_on "Move to next phase (melee results)"

    # Melee results
    # TODO
    click_on "Move to next phase (final orientation)"

    # Final orientation
    # TODO
    click_on "Move to next round"
    
    # Next round
    assert_current_path "/combats/#{combat_id}/round-2"
    assert_content "Combat ##{combat_id}"
    assert_content "Round 2"
    assert_content "Current phase: setup"
    
    within "#combatants" do
      assert_content "Auberc"
      assert_content "Balor"
      assert_content "Crocodile #1"
    end
  end
end
