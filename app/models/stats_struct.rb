StatsStruct = Struct.new(*Character::STATS, keyword_init: true) do
  def self.with_default(default)
    new(Character::STATS.to_h { |s| [s, default] })
  end
end
