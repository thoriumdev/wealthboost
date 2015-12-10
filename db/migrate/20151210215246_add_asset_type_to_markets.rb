class AddAssetTypeToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :asset_type, :string
  end
end
