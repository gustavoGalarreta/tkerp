class CreateTimeStations < ActiveRecord::Migration
  def change
    create_table :time_stations do |t|
      t.integer :user_id
      t.float :total_time, default: 0
      t.integer :parent_id
      t.timestamps null: false
    end
  end
end
