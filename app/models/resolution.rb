class Resolution
  include ActiveModel::Model
  
  attr_accessor :action, :roll
  delegate_missing_to :action
  
  class << self
    def for(action, **kwargs)
      new(action: action, **kwargs).tap { |r| r.extend _module_for(action.actionable) }
    end
  
    private
  
    def _module_for(actionable)
      case actionable
      when MissileAttack
        MissileAttackResolution
      else
        raise ArgumentError, "no resolution found for #{actionable}"
      end
    end
  end
end
