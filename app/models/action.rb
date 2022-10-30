# SMELL: Two methods (+after_initialize+ and +allowd?+) have to account for the fact 
#        that +base_activity_cost+ could be a Range.
class Action < ApplicationRecord
  belongs_to :participation
  
  delegate :combatant_name, :round, to: :participation
  
  enum :status, %w[declared successful failed], default: :declared
  
  validates_presence_of :participation, :type, :activity_cost
  # FIXME: validates activity_cost compared to base_activity_cost
  
  class_attribute :base_activity_cost
  
  after_initialize do
    self.activity_cost ||= (base_activity_cost.try(:max) || base_activity_cost)
  end
  
  def allowed?
    if base_activity_cost.respond_to? :cover?
      base_activity_cost.cover? participation.activity_left
    else
      base_activity_cost <= participation.activity_left
    end
  end
  
  def disallowed?
    !allowed?
  end
  
  def to_partial_path
    "actions/#{type.underscore}"
  end
end
