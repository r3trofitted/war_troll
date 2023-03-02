class CreateParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :participations do |t|
      t.integer :base_activity, null: false, default: 100
      t.references :round, null: false, foreign_key: true
      t.references :combatant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
