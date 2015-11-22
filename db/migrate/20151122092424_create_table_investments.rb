class CreateTableInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.string :ticker
      t.string :name
      t.decimal :average_exp_ratio
      t.belongs_to :user
      
      t.timestamps null:false
    end
  end
end
