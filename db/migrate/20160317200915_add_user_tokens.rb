class AddUserTokens < ActiveRecord::Migration
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmation_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
  end
end
