class CharacterFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(method, options = {})
    label_class = options.delete(:label_class) { "info" }

    label(method, class: label_class) do |b|
      @template.tag.span(b.translation) + super
    end
  end

  def tracker_field(method, options = {})
    text_field method, options.merge(label_class: "tracker")
  end
end
