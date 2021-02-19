module Actionable
  extend ActiveSupport::Concern
  
  included do
    has_one :action, as: :actionable, touch: true
    
    class << self
      attr_reader :activity
    end
  end
end
