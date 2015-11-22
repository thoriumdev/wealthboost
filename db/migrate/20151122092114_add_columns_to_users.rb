class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :return_today, :decimal, default: 6
    add_column :users, :return_retirement, :decimal, default: 5
  end
end
