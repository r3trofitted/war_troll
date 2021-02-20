class AddResultToMissileAttack < ActiveRecord::Migration[6.1]
  def change
    add_column :missile_attacks, :result, :string, null: true
  end
end
