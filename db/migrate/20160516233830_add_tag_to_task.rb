class AddTagToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :tags, :string, array: true
    add_index :tasks, :tags, using: :gin
  end
end
