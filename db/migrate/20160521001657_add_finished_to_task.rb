class AddFinishedToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :finished, :boolean, default: false
  end
end
