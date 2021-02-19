class CreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.references :participation, null: false
      t.integer :activity, null: false

      t.timestamps
    end
  end
end
