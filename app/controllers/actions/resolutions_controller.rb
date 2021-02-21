class Actions::ResolutionsController < ApplicationController
  def create
    action     = Action.find(params[:action_id])
    resolution = Resolution.for(action)
    
    resolution.resolve
    redirect_to combat_round_canonical_path(action.round.combat_id, action.round.number)
  end
  
  private
  
  def resolution_params
    params.require(:resolution).permit(:roll)
  end
end
