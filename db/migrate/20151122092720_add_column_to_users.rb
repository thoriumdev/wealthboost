class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :salary_growth, :decimal, default: 2.9
  end
end
