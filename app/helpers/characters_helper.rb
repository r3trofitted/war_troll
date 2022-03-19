module CharactersHelper
  def skill_rank_checkboxes(skill)
    25.times.map do |n|
      tag.label(class: class_names("skill-rank", { special: skill.special? })) do
        tag.span(class: "skill-rank-input") do
          tag.input(type: "checkbox", checked: (skill.ranks.to_i > n)) + tag.span(class: "skill-rank-control")
        end
      end
    end.join.html_safe
  end
end
