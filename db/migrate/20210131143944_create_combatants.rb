class CreateCombatants < ActiveRecord::Migration[6.1]
  def change
    create_table :combatants do |t|
      t.references :combatable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
