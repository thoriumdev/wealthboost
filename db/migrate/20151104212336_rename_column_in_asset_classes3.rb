class RenameColumnInAssetClasses3 < ActiveRecord::Migration
  def change
    rename_column :asset_classes, :multiassetclass, :multi_assetclass
  end
end
