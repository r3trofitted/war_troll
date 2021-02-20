class MissileAttackResolution
  include ActiveModel::Model
  
  attr_accessor :missile_attack, :roll
  
  def resolve
    missile_attack.actionable.update result: result
  end
  
  def result
    "8 hits" # SLIME
  end
end
