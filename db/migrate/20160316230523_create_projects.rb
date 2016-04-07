class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
	  	t.integer :client_id, null: false
	  	t.string :name
	  	t.string :description
	  	t.datetime :deleted_at
      t.timestamps null: false
    end
  end
end
