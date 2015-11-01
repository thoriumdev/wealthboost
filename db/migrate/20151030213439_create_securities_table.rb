class CreateSecuritiesTable < ActiveRecord::Migration
  def change
    create_table :securities do |t|
      t.string :security
      t.integer :asset_class_score
      t.integer :geo_area_score
      
      t.belongs_to :market
      
      t.timestamps null:false
    end
  end
end
