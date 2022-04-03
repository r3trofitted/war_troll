module CharactersHelper
  def skill_rank_checkboxes(rank, max_rank: 25, special: false)
    max_rank.times.map do |n|
      tag.label(class: class_names("skill-rank", { special: special })) do
        tag.span(class: "skill-rank-input") do
          tag.input(type: "checkbox", checked: (rank.to_i > n)) + tag.span(class: "skill-rank-control")
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
