class AddSkillDevelopmentCostsToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :skill_development_costs, :jsonb
  end
end
