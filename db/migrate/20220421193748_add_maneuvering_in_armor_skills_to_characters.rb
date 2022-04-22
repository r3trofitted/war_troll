class AddManeuveringInArmorSkillsToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :maneuvering_in_armor_skills, :jsonb
  end
end
