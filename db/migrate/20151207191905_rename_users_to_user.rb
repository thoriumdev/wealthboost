class RenameUsersToUser < ActiveRecord::Migration
  def change
    rename_column :wealth_boosts, :users_id, :user_id
  end
end
