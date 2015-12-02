class AddYearToWealthBoost < ActiveRecord::Migration
  def change
    add_column :wealth_boosts, :year, :integer, :default => 2015
  end
end
