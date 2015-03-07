class CreateMapNotes < ActiveRecord::Migration
  def change
    create_table :map_notes do |t|
      t.integer :user_id
      t.text :comment
      t.json :feature
      t.boolean :resolved, default: false

      t.timestamps null: false
    end
  end
end
