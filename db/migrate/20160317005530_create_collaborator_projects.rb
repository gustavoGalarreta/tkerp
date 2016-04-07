class CreateCollaboratorProjects < ActiveRecord::Migration
  def change
    create_table :collaborator_projects do |t|
      t.integer :collaborator_id
      t.integer :project_id
      t.timestamps null: false
    end
  end
end
