module RoundsHelper
  def vanity_combat_id(round)
    round.combat_id.to_s.rjust(3, "0")
  end
  
  def next_step_button(round)
    if round.finished?
      button_to t(".move_to_next_round"), next_round_path(@round), class: "action"
    else
      button_to t(".move_to_next_phase"), continue_round_path(@round), class: "action", title: t(@round.next_phase, scope: "phases")
    end
  end
end
