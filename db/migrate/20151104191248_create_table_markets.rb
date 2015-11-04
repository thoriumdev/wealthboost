class CreateTableMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :ticker
      t.string :fund_name
      t.string :total_assets
      t.string :asset_class
      t.string :geo_area
      t.string :expense_ratio
      t.string :asset_all_equity
      
      t.timestamps null:false
    end
  end
end
