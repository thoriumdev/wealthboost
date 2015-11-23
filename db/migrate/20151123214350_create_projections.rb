class CreateProjections < ActiveRecord::Migration
  def change
    create_table :projections do |t|
      t.integer :age
      t.integer :contribution
      t.integer :starting_value
      t.integer :ending_value
      t.integer :fees_paid
      
      t.belongs_to :user
    end
  end
end
