class MissileAttackResolutionsController < ApplicationController
  def create
    round      = Round.find(params[:round_id])
    resolution = MissileAttackResolution.new(missile_attack: round.actions.missile_attacks.unresolved.first, roll: missile_attack_resolution_params[:roll])
    
    @result = resolution.resolve
    redirect_to combat_round_canonical_path(round.combat_id, round.number)
  end
  
  private
  
  def missile_attack_resolution_params
    params.require(:missile_attack_resolution).permit(:roll)
  end
end
