class DropAssetClassTable < ActiveRecord::Migration
  def change
    drop_table :asset_classes
  end
end
