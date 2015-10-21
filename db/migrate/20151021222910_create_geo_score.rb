class CreateGeoScore < ActiveRecord::Migration
  def change
    create_table :geo_scores do |t|
      t.string :asia
      t.string :canada
      t.string :eafe
      t.string :emerging_markets
      t.string :europe
      t.string :global
      t.string :latin_america
      t.string :north_america
      t.string :united_states
      t.string :africa
      t.string :australia
      t.string :middle_east
      
      t.timestamps null:false
    end
  end
end