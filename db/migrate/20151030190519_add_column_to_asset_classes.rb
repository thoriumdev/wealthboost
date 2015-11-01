class AddColumnToAssetClasses < ActiveRecord::Migration
  def change
    add_column :asset_classes, :fixedincome, :integer
  end
end
