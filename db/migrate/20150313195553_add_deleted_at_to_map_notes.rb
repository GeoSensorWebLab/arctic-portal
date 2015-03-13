class AddDeletedAtToMapNotes < ActiveRecord::Migration
  def change
    add_column :map_notes, :deleted_at, :datetime
    add_index :map_notes, :deleted_at
  end
end
