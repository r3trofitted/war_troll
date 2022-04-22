module Skill
  ALL = [
    *AREAS = [:bows, :one_handed_crushing, :one_handed_edged, :pole_arms, :thrown, :two_handed, # Weapon skills
              :riding,                                                                          # General skills
              :directed_spells, :spell_lists,                                                   # Magical skills
              :adrenal_moves, :martial_arts],                                                   # Special skills
    *MANEUVERING_IN_ARMOR = [:soft_leather, :hard_leather, :chain, :plate],
    *OTHER = []
  ]
end
