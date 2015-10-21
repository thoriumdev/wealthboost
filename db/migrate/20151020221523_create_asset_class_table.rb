class CreateAssetClassTable < ActiveRecord::Migration
  def change
    create_table :asset_classes do |t|
      t.string :asset_class
      t.integer :commodities
      t.integer :equities
      t.integer :equities_dividendyield
      t.integer :equities_midcap
      t.integer :equities_realestate
      t.integer :equities_smallcap
      t.integer :equities_energy
      t.integer :equities_broad
      t.integer :equities_naturalresources
      t.integer :fixedincome_corporate
      t.integer :fixedincome_corporatehighyield
      t.integer :fixedincome_corporateinvestmentgrade
      t.integer :fixedincome_government
      t.integer :fixedincome_highyield
      t.integer :fixedincome_mortgage
      t.integer :fixedincome_governmentinflationprotected
      t.integer :fixedincome_governmentshortduration
      t.integer :fixedincome_governmentintermediateduration
      t.integer :fixedincome_governmentlongduration
      t.integer :fixedincome_corporateshortduration
      t.integer :fixedincome_corporateintermediateduration
      t.integer :fixedincome_corporatelongduration
      t.integer :fixedincome_multiassetclass
      t.integer :fixedincome_municipal
      t.integer :multiassetclass
      t.integer :alternativeinvestments
      
      t.timestamps null:false
    end
  end
end