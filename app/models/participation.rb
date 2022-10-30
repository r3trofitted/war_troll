class Participation < ApplicationRecord
  belongs_to :round
  belongs_to :combatant
  has_many :actions do
    def prepared_for_current_phase
      where(type: available_types)
    end
    
    def available_for_current_phase
      available_types.filter_map do |t|
        Action.new(type: t, participation: proxy_association.owner) unless t.in? prepared_for_current_phase.map(&:type)
      end
    end
    
    private
    
    def available_types
      proxy_association.owner.round.action_types
    end
  end
  
  accepts_nested_attributes_for :combatant, reject_if: :all_blank
  
  validates_presence_of :base_activity, :round, :combatant
  
  delegate :name, to: :combatant, prefix: true
  
  def activity_left
    base_activity - actions.sum(&:activity_cost)
  end
end
