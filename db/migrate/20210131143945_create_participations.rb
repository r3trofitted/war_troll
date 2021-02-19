class CreateParticipations < ActiveRecord::Migration[6.1]
  def change
    create_table :participations do |t|
      t.references :round, null: false, foreign_key: true
      t.references :combatant, null: false, foreign_key: true
      t.integer :base_activity, null: false, default: 100

      t.timestamps
      
      t.index [:round_id, :combatant_id], unique: true
    end
  end
end
