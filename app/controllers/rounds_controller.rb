class RoundsController < ApplicationController
  def show
    @round = Round.find_by combat_id: params[:combat_id], number: params[:number]
  end
  
  def continue
    @round = Round.find params[:id]
    
    if @round.continue!
      redirect_to combat_round_canonical_path(@round.combat_id, @round.number)
    else
      render :show
    end
  end
end
