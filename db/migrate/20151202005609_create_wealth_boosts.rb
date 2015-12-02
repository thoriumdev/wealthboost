class CreateWealthBoosts < ActiveRecord::Migration
  def change
    create_table :wealth_boosts do |t|
      t.decimal :current_port
      t.decimal :low_fee_port
      t.decimal :wealth_boost
      t.decimal :growth_current
      t.decimal :growth_low_fee
      t.decimal :fees_current
      t.decimal :fees_low_fee
      t.decimal :assum_proj_return
      t.decimal :current_exp_ratio
      t.decimal :current_net_return
      t.decimal :low_fee_exp_ratio
      t.decimal :low_fee_net_return
      t.integer :final_year_proj
      t.integer :proj_period
      t.decimal :initial_port_value
      
      t.belongs_to :users
      t.timestamps null:false
    end
  end
end
