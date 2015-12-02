class AddColumnsToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :five, :decimal, :default => 0.05
    add_column :markets, :ten, :decimal, :default => 0.05
    add_column :markets, :fifteen, :decimal, :default => 0.05
    add_column :markets, :twenty, :decimal, :default => 0.05
    add_column :markets, :retirement, :decimal, :default => 0.05
  end
end
