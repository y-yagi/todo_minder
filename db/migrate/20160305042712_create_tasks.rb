class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :detail
      t.references :list, foreign_key: true
      t.references :user, foreign_key: true
      t.datetime :deadline_at
      t.integer :weighting

      t.timestamps
    end
  end
end
