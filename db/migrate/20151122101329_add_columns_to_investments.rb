class AddColumnsToInvestments < ActiveRecord::Migration
  def change
    add_column :investments, :investment_one, :string
    add_column :investments, :investment_two, :string
    add_column :investments, :investment_three, :string
  end
end
