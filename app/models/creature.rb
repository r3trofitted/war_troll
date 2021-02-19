class Creature < ApplicationRecord
  include Combatable
  
  belongs_to :template, class_name: "Creature", optional: true
  
  scope :templates, -> { where(template: nil) }
  scope :individuals, -> { where.not(template: nil) }
end
