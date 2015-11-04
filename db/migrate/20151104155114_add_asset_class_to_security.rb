class AddAssetClassToSecurity < ActiveRecord::Migration
  def change
    add_column :securities, :asset_class, :string
  end
end
