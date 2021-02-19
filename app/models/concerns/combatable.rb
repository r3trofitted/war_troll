module Combatable
  extend ActiveSupport::Concern
  
  included do
    has_one :combatant, as: :combatable, touch: true
  end
end
