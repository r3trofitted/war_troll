class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.references :participation, null: false, foreign_key: true
      t.string :type
      t.integer :activity_cost, null: false
      t.integer :status

      t.timestamps
    end
  end
end
