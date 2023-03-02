class Combat < ApplicationRecord
  has_many :rounds, -> { order(number: :asc) }
  
  def self.create_at_first_round
    create(rounds: [Round.new(number: 1)])
  end
  
  def first_round
    rounds.first
  end
end
