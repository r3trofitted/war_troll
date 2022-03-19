require "application_system_test_case"

class CharacterSheetsTest < ApplicationSystemTestCase
  setup do
    I18n.default_locale = :en
  end

  test "looking up a character sheet" do
    visit "characters/#{characters(:auberc).id}"

    assert_selector "h1", text: "Auberc"

    # Race & profession
    with_options readonly: true do
      assert_field "Race", with: "Human"
      assert_field "Profession", with: "Fighter"
      assert_field "Realm of Power", with: "Essence"
      assert_field "Level", with: "3"
      assert_field "Experience points", with: "32150"
    end

    # Appearance
    assert_field "Height", with: "1,78 m"
    assert_field "Weight", with: "77 kg"
    assert_field "Eyes", with: "Blue"
    assert_field "Hair", with: "Fair"
    assert_field "Gender", with: "Male"

    # Health
    with_options readonly: true do
      assert_field "Soul departure", with: "12"
      assert_field "Deterioration", with: "0"
      assert_field "Recovery", with: "×1"
      assert_field "Type of hit dice", with: "d8"
      assert_field "Maximum base hit points", with: "120"
    end

    # TODO: Hits points
    # TODO: Power points
    # TODO: Stats
    # TODO: Resistance Rolls
    # TODO: Shield

    # Defensive Bonus
   within_fieldset "Defensive bonus" do
      assert_selector 'h1', text: "Defensive bonus"
      
      with_options readonly: true do
        assert_field "Normal bonus", with: "+10", placeholder: "Qu"
        assert_field "Object bonus", with: nil, placeholder: "obj."
        assert_field "Special bonus", with: nil, placeholder: "sp."
        assert_field "Total bonus", with: "+10"
      end
    end
    
    # TODO: Portrait
    # TODO: Movement
    # TODO: Armor Type

    # Skills
    within_fieldset "Skills" do
      # Sample maneuvering-in-armor skill
      within(:xpath, "//section[contains(concat(' ', normalize-space(@class), ' '), 'skill')][./h1[text()='Plate']]") do
        assert_field "Development cost", with: "2/*", readonly: true
        assert_selector "input[type='checkbox']:checked", count: 14, visible: false
        with_options readonly: true do
          assert_field "Skill rank bonus", with: "+70"
          refute_field "Normal bonus" # No stat bonus for maneuvering-in-armor skills
          assert_field "Object bonus", with: nil, placeholder: "obj."
          refute_field "Level bonus"  # No level bonus for maneuvering-in-armor skills
          assert_field "Special bonus #1", with: nil, placeholder: "sp."
          assert_field "Special bonus #2", with: nil, placeholder: "sp."
          assert_field "Max. penalty", with: "-90", placeholder: "sp."
          assert_field "Total bonus", with: "-20"
        end
      end
      
      # Sample weapon skill
      within(:xpath, "//section[contains(concat(' ', normalize-space(@class), ' '), 'skill')][./h1[text()='Two-handed sword']]") do
        assert_field "Development cost", with: "1/5", readonly: true
        assert_selector "input[type='checkbox']:checked", count: 6, visible: false
        with_options readonly: true do
          assert_field "Skill rank bonus", with: "+30"
          assert_field "Normal bonus", with: "+15"
          assert_field "Object bonus", with: nil, placeholder: "obj."
          assert_field "Level bonus", with: "+9"
          assert_field "Special bonus", with: nil, placeholder: "sp."
          assert_field "Special bonus", with: nil, placeholder: "sp."
          assert_field "Special bonus", with: nil, placeholder: "sp."
          assert_field "Total bonus", with: "+54"
        end
      end
      
      # Sample primary skill
      within(:xpath, "//section[contains(concat(' ', normalize-space(@class), ' '), 'skill')][./h1[text()='Perception']]") do
        assert_field "Development cost", with: "2/5", readonly: true
        assert_selector "input[type='checkbox']:checked", count: 4, visible: false
        with_options readonly: true do
          assert_field "Skill rank bonus", with: "+20"
          assert_field "Normal bonus", with: "0"
          assert_field "Object bonus", with: nil, placeholder: "obj."
          refute_field "Level bonus"
          assert_field "Special bonus #1", with: nil, placeholder: "sp."
          assert_field "Special bonus #2", with: nil, placeholder: "sp."
          assert_field "Special bonus #3", with: nil, placeholder: "sp."
          assert_field "Total bonus", with: "+20"
        end
      end
    end
    
    # Skill areas
    within_fieldset "Skill areas" do
      within(:xpath, "//section[./h1[text()='Bows']]")                { assert_field "Development cost", with: "5", readonly: true }
      within(:xpath, "//section[./h1[text()='One-handed crushing']]") { assert_field "Development cost", with: "2/7", readonly: true }
      within(:xpath, "//section[./h1[text()='One-handed edged']]")    { assert_field "Development cost", with: "2/5", readonly: true }
      within(:xpath, "//section[./h1[text()='Pole arms']]")           { assert_field "Development cost", with: "2/7", readonly: true }
      within(:xpath, "//section[./h1[text()='Thrown']]")              { assert_field "Development cost", with: "2/7", readonly: true }
      within(:xpath, "//section[./h1[text()='Two-handed']]")          { assert_field "Development cost", with: "1/5", readonly: true }
    
      within(:xpath, "//section[./h1[text()='Riding']]")              { assert_field "Development cost", with: "2/6", readonly: true }
    
      within(:xpath, "//section[./h1[text()='Directed spells']]")     { assert_field "Development cost", with: "20", readonly: true }
      within(:xpath, "//section[./h1[text()='Spell lists']]")         { assert_field "Development cost", with: "20", readonly: true }
    
      within(:xpath, "//section[./h1[text()='Adrenal moves']]")       { assert_field "Development cost", with: "20", readonly: true }
      within(:xpath, "//section[./h1[text()='Martial arts']]")        { assert_field "Development cost", with: "3/7", readonly: true }
    end
    
    # TODO: Languages
  end
end
