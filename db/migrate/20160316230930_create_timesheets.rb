class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :user_id
      t.integer :task_id
      t.integer :project_id
      t.datetime :start_time
      t.datetime :stop_time
      t.float :total_time, default: 0
      t.boolean :running, default: false
      t.string :notes
      t.date :belongs_to_day
      t.datetime :deleted_at
      t.timestamps null: false
    end
    add_index :timesheets, :deleted_at
  end
end
