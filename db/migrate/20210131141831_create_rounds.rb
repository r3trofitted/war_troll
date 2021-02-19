class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.references :combat, null: false, foreign_key: true
      t.integer :number, default: 1, null: false
      t.integer :phase, default: 1, null: false

      t.timestamps
      
      t.index [:combat_id, :number], unique: true
    end
  end
end
