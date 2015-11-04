class RemoveColumnsFromMarkets < ActiveRecord::Migration
  def change
    remove_column :markets, :five
    remove_column :markets, :ten
    remove_column :markets, :fifteen
    remove_column :markets, :twenty
    remove_column :markets, :retirement
  end
end
