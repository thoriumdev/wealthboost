class UpdateUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :income, :integer
    add_column :users, :retired, :boolean, default: false
    add_column :users, :current_investments_amount, :integer
    add_column :users, :current_investments, :boolean, default: false
  end
end
