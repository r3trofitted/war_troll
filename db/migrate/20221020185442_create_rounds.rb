class CreateRounds < ActiveRecord::Migration[7.0]
  def change
    create_table :rounds do |t|
      t.references :combat, null: false, foreign_key: true
      t.integer :number
      t.integer :phase

      t.timestamps
    end
  end
end
