class UpdateColumnInAssetClasses < ActiveRecord::Migration
  def change
    rename_column :asset_classes, :fixedincome_multiassetclass, :fixedincome_multi_assetclass
  end
end
