require "application_system_test_case"

class CombatTrackerTest < ApplicationSystemTestCase
  Capybara.add_selector :combatant_card do
    # matches `<article class="combatant_card">` elements with an `<h3>` child that contains the passed name
    xpath { |name| ".//article[contains(@class, 'combatant_card') and h3[text()='#{name}']]" }
  end
  
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
    
    within :combatant_card, "Auberc" do
      assert_button "Prepare a spell"
      assert_button "Cast a spell"
    end
    
    within :combatant_card, "Balor" do
      assert_button "Prepare a spell"
      assert_button "Cast a spell"
      
      click_on "Cast a spell"
      
      assert_button "Prepare a spell", disabled: true
      refute_button "Cast a spell"
      assert_text "Balor casts a spell"
      assert_text %r|Activity left\s*25%|
    end
    
    within :combatant_card, "Crocodile #1" do
      assert_button "Prepare a spell"
      assert_button "Cast a spell"
    end
    
    click_on "Move to next phase"
    
    # Spell results
    within :combatant_card, "Balor" do
      assert_text "Was the spell successful?"
      assert_button "Yes"
      assert_button "No"
      
      click_on "No"
      
      assert_text "Balor's spell fails"
      refute_button "Yes"
      refute_button "No"
      
      click_on "change"
      
      assert_button "Yes"
      assert_button "No"
      
      click_on "Yes"
      
      assert_text "Balor's spell succeeds"
    end
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
