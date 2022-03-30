class Character < ApplicationRecord
  enum :gender, %i(male female), default: :male
  enum :maximum_pace, %i(walk fast_walk run sprint fast_sprint dash), default: :dash
  
  STATS = %i(constitution agility self_discipline memory reasoning strength quickness presence empathy intuition)
end
