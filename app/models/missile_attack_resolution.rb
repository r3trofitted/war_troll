module MissileAttackResolution
  delegate :missile_attack, to: :action, private: true
  
  def resolve
    missile_attack.update result: result
  end
  
  def result
    "8 hits" # SLIME
  end
end
