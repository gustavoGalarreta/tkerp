class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
    	t.integer :collaborator_id, null: false
    	t.boolean :current, default: false
    	t.string :name
      t.date :start
      t.date :finish
      t.timestamps null: false
    end
  end
end
