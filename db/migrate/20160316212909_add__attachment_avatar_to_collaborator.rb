class AddAttachmentAvatarToCollaborator < ActiveRecord::Migration
  def self.up
    change_table :collaborators do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :collaborators, :avatar
  end
end
