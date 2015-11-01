class AddTotalScoreColumnToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :total_score, :integer
  end
end
