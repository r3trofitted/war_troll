class CreateCreatures < ActiveRecord::Migration[6.1]
  def change
    create_table :creatures do |t|
      t.string :name, null: false
      t.references :template, foreign_key: { to_table: :creatures }

      t.timestamps
    end
  end
end
