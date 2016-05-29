class AddTodaysToTask < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :todays, :boolean, default: false
  end
end
