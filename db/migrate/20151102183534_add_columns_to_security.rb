class AddColumnsToSecurity < ActiveRecord::Migration
  def change
    add_column :securities, :expense_ratio, :integer
    add_column :securities, :total_assets, :integer
  end
end
