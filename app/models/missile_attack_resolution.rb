class MissileAttackResolution
  include ActiveModel::Model
  
  attr_accessor :missile_attack
  
  def enter_roll(roll)
    missile_attack.actionable.update roll: roll
  end
end
