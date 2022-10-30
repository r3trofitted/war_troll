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
    assert_content "Current phase: Setup"
    
    click_on "Add a combatant"
    fill_in "Name", with: "Auberc"
    fill_in "Hits", with: "50"
    click_on "Add"
    
    click_on "Add a combatant"
    fill_in "Name", with: "Balor"
    fill_in "Hits", with: "60"
    click_on "Add"
    
    click_on "Add a combatant"
    fill_in "Name", with: "Crocodile #1"
    fill_in "Hits", with: "80"
    click_on "Add"
    
    click_on "Move to next phase"
    
    # Spell
    within "#combatants" do
      assert_content "Auberc"
      assert_content "Balor"
      assert_content "Crocodile #1"
      
      refute_content "Add a combatant"
    end
    
    click_on "Move to next phase"
    
    # Spell results
    # TODO
    click_on "Move to next phase"
    
    # Spell orientation
    # TODO
    click_on "Move to next phase"

    # Fire (A)
    # TODO
    click_on "Move to next phase"

    # Fire resuls (A)
    # TODO
    click_on "Move to next phase"

    # Movement.maneuvre
    # TODO
    click_on "Move to next phase"

    # Fire (B)
    # TODO
    click_on "Move to next phase"

    # Fire results (B)
    # TODO
    click_on "Move to next phase"

    # Melee
    # TODO
    click_on "Move to next phase"

    # Melee results
    # TODO
    click_on "Move to next phase"

    # Final orientation
    # TODO
    click_on "Move to next round"
    
    # Next round
    assert_current_path "/combats/#{combat_id}/round-2"
    assert_content "Combat ##{combat_id}"
    assert_content "Round 2"
    assert_content "Current phase: Setup"
    
    within "#combatants" do
      assert_content "Auberc"
      assert_content "Balor"
      assert_content "Crocodile #1"
    end
  end
end
