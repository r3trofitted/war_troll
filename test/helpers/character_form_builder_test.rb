require "test_helper"

# Testing a FormBuilder is a bit cumbersome, it that it cannot be done in isolation from a view
# Furthermore, making assertions against parsed HTML (ie. a DOM tree) requires to append the 
# FormBuilder-generated HTML to the test view (ie. it cannot be assigned to a local variable 
# as with regular helper tests)
class CharacterFormBuilderTest < ActionView::TestCase
  setup do
    @builder = CharacterFormBuilder.new(:character, characters(:auberc), self, {})
  end
  
  test "#text_field wraps the input in a <label> with a <span>" do
    html = @builder.text_field(:name)
    
    assert_dom_equal <<~HTML, html, strict: false
      <label class="info" for="character_name">
        <span>Name</span>
        <input value="Auberc" type="text" name="character[name]" id="character_name">
      </label>
    HTML
  end
  
  test "#text_field accepts a :label_class argument to override the default CSS class on the label" do
    concat @builder.text_field(:name, label_class: "overridden") # rendering straight to the test view so that assert_dom works
    
    assert_dom "label.overridden"
  end
  
  test "#tracker_field wraps the input in a <label> with a <span> and adds the 'tracker' class to the label" do
    html = @builder.tracker_field(:hit_points, value: 65) # FIXME: the value is slimed; it should come from the fixture
    
    assert_dom_equal <<~HTML, html, strict: false
      <label class="tracker" for="character_hit_points">
        <span>Hit points</span>
        <input value="65" type="text" name="character[hit_points]" id="character_hit_points">
      </label>
    HTML
  end
  
  test "#bonus_field wraps the input in a <label> with a <span> and adds the 'bonus' class to the label" do
    html = @builder.bonus_field :stub, value: "+5"
    
    assert_dom_equal <<~HTML, html, strict: false
      <label class="bonus" for="character_stub">
        <span>Stub</span>
        <input value="+5" type="text" name="character[stub]" id="character_stub">
      </label>
    HTML
  end
  
  test "#bonus_field adds the extra CSS class 'total' according to the :kind option" do
    concat @builder.bonus_field :stub, value: "+15", kind: :total
    
    assert_dom "label.bonus.total"
  end
  
  test "#bonus_field adds a translated placeholder according to the :kind option" do
    I18n.with_locale :fr do
      concat @builder.bonus_field :stub, value: "+15", kind: :total
      assert_dom "input[placeholder='total']"
  
      concat @builder.bonus_field :stub, value: "+15", kind: :object
      assert_dom "input[placeholder='obj.']"
      
      concat @builder.bonus_field :stub, value: "+15", kind: :level
      assert_dom "input[placeholder='niv.']"
  
      concat @builder.bonus_field :stub, value: "+15", kind: :race
      assert_dom "input[placeholder='race']"
  
      concat @builder.bonus_field :stub, value: "+15", kind: :special
      assert_dom "input[placeholder='sp.']"
  
      concat @builder.bonus_field :stub, value: "+15", kind: "Irrégulier"
      assert_dom "input[placeholder='Irrégulier']"
    end
  end
end
