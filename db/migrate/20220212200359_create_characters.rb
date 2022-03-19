class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :race
      t.string :profession
      t.string :realm_of_power
      t.integer :level
      t.integer :experience_points
      t.jsonb :stats
      t.integer :height
      t.integer :weight
      t.string :eyes_color
      t.string :hair_color
      t.integer :age
      t.integer :gender, default: 0
      t.integer :base_movement_rate
      t.integer :maximum_pace, default: 0

      t.timestamps
    end
  end
end
