module Skill
  class Bundle
    delegate_missing_to :@_content
    
    def initialize(*skills, klass:)
      struct = Struct.new(*skills, keyword_init: true) # OPTIMIZE: the Struct could be cached and re-used
      
      @_content = struct.new.tap do |s|
        s.each_pair { |skill, _| s[skill] = klass.new }
      end
    end
  end
end
