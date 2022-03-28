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

  def bonus_field(method, options = {})
    kind = options.delete(:kind).to_s.inquiry

    label_class = ["bonus"]
    label_class << ["total"] if kind.total?

    placeholder = I18n.translate("helpers.bonus_field.#{kind}", default: kind) if kind.present?
    text_field method, options.merge(label_class: label_class, placeholder: placeholder)
  end
end
