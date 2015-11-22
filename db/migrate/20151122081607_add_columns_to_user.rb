class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :investments_length, :integer
    add_column :users, :current_custodian, :string
  end
end
