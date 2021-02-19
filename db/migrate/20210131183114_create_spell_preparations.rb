class CreateSpellPreparations < ActiveRecord::Migration[6.1]
  def change
    create_table :spell_preparations do |t|
      t.string :spell

      t.timestamps
    end
  end
end
