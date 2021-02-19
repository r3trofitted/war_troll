class CreateCombats < ActiveRecord::Migration[6.1]
  def change
    create_table :combats do |t|

      t.timestamps
    end
  end
end
