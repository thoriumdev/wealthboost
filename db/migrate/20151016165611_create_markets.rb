class CreateMarkets < ActiveRecord::Migration
  def change
    create_table :markets do |t|
      t.string :data_source
      t.string :security_type
      t.string :can_or_us
      t.string :ticker
      t.string :fund_name
      t.integer :total_assets
      t.integer :fund_size_monthly
      
      t.timestamps null:false
    end
  end
end
