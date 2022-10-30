class Participation < ApplicationRecord
  belongs_to :round
  belongs_to :combatant
  has_many :actions do
    delegate :round, to: :'proxy_association.owner'
    
    def prepared_for_current_phase
      where(type: round.action_types.map(&:sti_name))
    end
    
    def available_for_current_phase
      round.action_types.filter_map do |klass|
        klass.new(participation: proxy_association.owner) unless prepared_for_current_phase.to_a.any?(klass)
      end
    end
    
    def resolvable_for_current_phase
      where(type: round.resolvable_types.map(&:sti_name))
    end
  end
  
  accepts_nested_attributes_for :combatant, reject_if: :all_blank
  
  validates_presence_of :base_activity, :round, :combatant
  
  delegate :name, to: :combatant, prefix: true
  delegate :at_action_phase?, :at_resolution_phase?, :at_orientation_phase?, to: :round
  
  def activity_left
    base_activity - actions.sum(&:activity_cost)
  end
  
  def resolution
    if first_pending_action = actions.resolvable_for_current_phase.first
      Resolution.new(action: first_pending_action)
    end
  end
end
