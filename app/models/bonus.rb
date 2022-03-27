class Bonus < Numeric
  attr_reader :value
  
  def initialize(value)
    @value = value.to_i
  end
  
  def <=>(other)
    value <=> other.to_i
  end
  
  def +(other)
    Bonus.new(value + other)
  end
  
  def -(other)
    Bonus.new(value - other)
  end
  
  def *(number)
    Bonus.new(value * number)
  end
  
  def /(number)
    Bonus.new(value / number)
  end
  
  def coerce(other)
    case other
    when Float
      [other, value.to_f]
    else
      [other, value]
    end
  end
  
  def to_i
    value
  end
  
  def to_s
    if value.zero?
      value.to_s
    else
      '%+d' % value
    end
  end
end
