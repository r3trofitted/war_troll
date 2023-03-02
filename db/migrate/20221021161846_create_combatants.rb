class CreateCombatants < ActiveRecord::Migration[7.0]
  def change
    create_table :combatants do |t|
      t.string :name, null: false
      t.integer :base_hit_points, null: false
      
      t.timestamps
    end
  end
end
