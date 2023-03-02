class CombatsController < ApplicationController
  def create
    if combat = Combat.create_at_first_round
      redirect_to combat.first_round
    end
  end
end
