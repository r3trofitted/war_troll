class RoundsController < ApplicationController
  layout "combat_tracker"
  
  def show
    @round = Round.find_by! combat_id: params[:combat_id], number: params[:number]
  end
  
  def continue
    @round = Round.find params[:id]
  
    if @round.continue!
      redirect_to @round
    else
      render :show
    end
  end
  
  def next
    @round = Round.find params[:id]
    
    if next_round = @round.next
      redirect_to next_round
    else
      render :show
    end
  end
end
