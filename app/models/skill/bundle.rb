module Skill
  class Bundle
    delegate_missing_to :@_struct
    
    def initialize(*skills)
      @_struct = Struct.new(*skills, keyword_init: true).new # OPTIMIZE: the Struct could be cached and re-used
    end
  end
end
