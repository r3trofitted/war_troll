class Actions::MissileAttackResolutionsController < ApplicationController
  def create
    missile_attack = Action.find(params[:action_id])
    resolution = MissileAttackResolution.new(missile_attack: missile_attack, roll: missile_attack_resolution_params[:roll])
    
    @result = resolution.resolve
    redirect_to combat_round_canonical_path(missile_attack.round.combat_id, missile_attack.round.number)
  end
  
  private
  
  def missile_attack_resolution_params
    params.require(:missile_attack_resolution).permit(:roll)
  end
end
