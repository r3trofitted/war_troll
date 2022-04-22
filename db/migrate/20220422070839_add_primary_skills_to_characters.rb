class AddPrimarySkillsToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :primary_skills, :jsonb
  end
end
