class AddRolePinCodeAvatarArchivedAtToCollaborator < ActiveRecord::Migration
  def change
    add_column :collaborators, :qr_code, :string
    add_column :collaborators, :archived_at, :datetime
  end
end
