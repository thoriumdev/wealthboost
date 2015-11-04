class ChangeColumnInSecurity < ActiveRecord::Migration
  def change
    change_column :securities, :expense_ratio, 'decimal USING CAST(expense_ratio AS decimal)'
    change_column :securities, :total_assets, 'decimal USING CAST(total_assets AS decimal)'
  end
end
