class AddTwoColumnsToInvestments < ActiveRecord::Migration
  def change
    add_column :investments, :allocation_inv_one, :decimal
    add_column :investments, :allocation_inv_two, :decimal
    add_column :investments, :allocation_inv_three, :decimal
  end
end
