class AddColumnToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :asset_class_score, :integer
    add_column :markets, :geo_score, :integer
  end
end
