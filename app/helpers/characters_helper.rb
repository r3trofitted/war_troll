module CharactersHelper
  # TODO: the number of ranks should be adjustable depending on the skill (ie. only 15 ranks for the Plate skill if the character wears a TA17)
  def skill_rank_checkboxes(skill)
    25.times.map do |n|
      tag.label(class: class_names("skill-rank", { special: skill.special? })) do
        tag.span(class: "skill-rank-input") do
          tag.input(type: "checkbox", checked: (skill.ranks.to_i > n)) + tag.span(class: "skill-rank-control")
        end
      end
    end.join.html_safe
  end
  
    
  def na_bonus_tag
    label("-", class: "bonus") do |b|
      tag.span + text_field_tag("-", "-", disabled: true)
    end
  end
end
