class CreateDeletedTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :deleted_tasks do |t|
      t.string :detail
      t.references :list
      t.references :user, foreign_key: true
      t.datetime :deadline_at
      t.integer :point

      t.timestamps
    end
  end
end
