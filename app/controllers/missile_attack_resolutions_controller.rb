class MissileAttackResolutionsController < ApplicationController
  def create
    round      = Round.find(params[:round_id])
    resolution = MissileAttackResolution.new(missile_attack: round.actions.missile_attacks.unresolved.first)
    
    @result = resolution.enter_roll(missile_attack_resolution_params[:roll])
  end
  
  private
  
  def missile_attack_resolution_params
    params.require(:missile_attack_resolution).permit(:roll)
  end
end
