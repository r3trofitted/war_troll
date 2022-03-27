module Stat
  class Primary
    STAT_BONUS_TABLE = {
      101 => 30, 102 => 35,
       91 => 10,  92 => 10, 93 => 10, 94 => 10, 95 => 15, 96 => 15, 97 => 15, 98 => 20, 99 => 20, 100 => 25,
       81 => 5,   82 => 5,  83 => 5,  84 => 5,  85 => 5,  86 => 5,  87 => 5,  88 => 5,  89 => 5,   90 => 10,
       71 => 0,   72 => 0,  73 => 0,  74 => 0,  75 => 5,  76 => 5,  77 => 5,  78 => 5,  79 => 5,   80 => 5,
       61 => 0,   62 => 0,  63 => 0,  64 => 0,  65 => 0,  66 => 0,  67 => 0,  68 => 0,  69 => 0,   70 => 0,
       51 => 0,   52 => 0,  53 => 0,  54 => 0,  55 => 0,  56 => 0,  57 => 0,  58 => 0,  59 => 0,   60 => 0,
       41 => 0,   42 => 0,  43 => 0,  44 => 0,  45 => 0,  46 => 0,  47 => 0,  48 => 0,  49 => 0,   50 => 0,
       31 => 0,   32 => 0,  33 => 0,  34 => 0,  35 => 0,  36 => 0,  37 => 0,  38 => 0,  39 => 0,   40 => 0,
       21 => -5,  22 => -5, 23 => -5, 24 => -5, 25 => 0,  26 => 0,  27 => 0,  28 => 0,  29 => 0,   30 => 0,
       11 => -5,  12 => -5, 13 => -5, 14 => -5, 15 => -5, 16 => -5, 17 => -5, 18 => -5, 19 => -5,  20 => -5,
        1 => -25,  2 => -20, 3 => -15, 4 => -15, 5 => -10, 6 => -10, 7 => -10, 8 => -10, 9 => -10, 10 => -5
    }
  
    POWER_POINTS_TABLE = {
      101 => 3, 102 => 4,
       91 => 1,  92 => 1, 93 => 1, 94 => 1, 95 => 2, 96 => 2, 97 => 2, 98 => 2, 99 => 2, 100 => 3,
       81 => 1,  82 => 1, 83 => 1, 84 => 1, 85 => 1, 86 => 1, 87 => 1, 88 => 1, 89 => 1,  90 => 1,
       71 => 0,  72 => 0, 73 => 0, 74 => 0, 75 => 1, 76 => 1, 77 => 1, 78 => 1, 79 => 1,  80 => 1,
       61 => 0,  62 => 0, 63 => 0, 64 => 0, 65 => 0, 66 => 0, 67 => 0, 68 => 0, 69 => 0,  70 => 0,
       51 => 0,  52 => 0, 53 => 0, 54 => 0, 55 => 0, 56 => 0, 57 => 0, 58 => 0, 59 => 0,  60 => 0,
       41 => 0,  42 => 0, 43 => 0, 44 => 0, 45 => 0, 46 => 0, 47 => 0, 48 => 0, 49 => 0,  50 => 0,
       31 => 0,  32 => 0, 33 => 0, 34 => 0, 35 => 0, 36 => 0, 37 => 0, 38 => 0, 39 => 0,  40 => 0,
       21 => 0,  22 => 0, 23 => 0, 24 => 0, 25 => 0, 26 => 0, 27 => 0, 28 => 0, 29 => 0,  30 => 0,
       11 => 0,  12 => 0, 13 => 0, 14 => 0, 15 => 0, 16 => 0, 17 => 0, 18 => 0, 19 => 0,  20 => 0,
        1 => 0,   2 => 0,  3 => 0,  4 => 0,  5 => 0,  6 => 0,  7 => 0,  8 => 0,  9 => 0,  10 => 0
    }
  
    attr_reader :temporary_value, :potential_value, :bonus_modification
  
    attr_reader :temporary_value, :potential_value, :name, :abbr
  
    def initialize(temporary_value, potential_value, bonus_modification = nil, name, abbr)
      @temporary_value, @potential_value = temporary_value.to_i, potential_value.to_i
      @bonus_modification = bonus_modification
      @name, @abbr = name, abbr
    end
  
    def normal_bonus
      STAT_BONUS_TABLE.fetch temporary_value
    end
  
    def power_points
      POWER_POINTS_TABLE.fetch temporary_value
    end
    
    # FIXME: slime!
    def bonus_modification
      0
    end
  
    def total_bonus
      normal_bonus + bonus_modification
    end
    alias_method :bonus, :total_bonus
    
    def to_partial_path
      "characters/stat"
    end
  end
end
