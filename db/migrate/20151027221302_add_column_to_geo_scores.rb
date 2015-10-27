class AddColumnToGeoScores < ActiveRecord::Migration
  def change
    add_column :geo_scores, :geo_location, :string
  end
end
