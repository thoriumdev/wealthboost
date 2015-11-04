class CreateMarketsTable2 < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :ticker
      t.string :fund_name
      t.decimal :total_assets
      t.string :asset_class
      t.string :geo_area
      t.decimal :expense_ratio
      t.decimal :asset_all_equity
      
      t.timestamps null:false
    end
  end
end
