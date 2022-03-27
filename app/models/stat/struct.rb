module Stat
  Struct = ::Struct.new(*ALL, keyword_init: true) do
    def self.with_default(default)
      new(ALL.to_h { |s| [s, default] })
    end
  end
end
