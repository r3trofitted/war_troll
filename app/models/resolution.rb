class Resolution
  include ActiveModel::Model
  
  attr_accessor :action
  
  delegate :participation, :status, to: :action
  delegate :round, :combatant_name, to: :participation
  
  def pending?
    @action.declared?
  end
  
  def success!
    @action.successful!
  end
  
  def failure!
    @action.failed!
  end
  
  def undo!
    @action.declared!
  end
end
