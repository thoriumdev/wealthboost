class DropMarketsTable2 < ActiveRecord::Migration
  def change
    drop_table :markets
  end
end
