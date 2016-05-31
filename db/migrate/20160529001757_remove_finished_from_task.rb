class RemoveFinishedFromTask < ActiveRecord::Migration[5.0]
  def change
    remove_column :tasks, :finished, :boolean, default: false
  end
end
