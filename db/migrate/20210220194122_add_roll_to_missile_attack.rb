class AddRollToMissileAttack < ActiveRecord::Migration[6.1]
  def change
    add_column :missile_attacks, :roll, :integer, null: true
  end
end
