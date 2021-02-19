class CreateMissileAttacks < ActiveRecord::Migration[6.1]
  def change
    create_table :missile_attacks do |t|
      t.string :phase, null: false, default: "A"
      t.string :weapon
      t.references :target

      t.timestamps
    end
  end
end
