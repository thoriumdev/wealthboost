class CreateMarketsTable < ActiveRecord::Migration
  def change
    create_table :markets_tables do |t|
      t.string :ticker
      t.string :fund_name
      t.string :tot_asset_m
      t.string :asset_class_broad
      t.string :geographic_focus_revised
      t.string :expense_ratio
      t.string :asset_all__equity
      t.integer :yearly_return_year1993_cad
      t.integer :yearly_return_year1994_cad
      t.integer :yearly_return_year1995_cad
      t.integer :yearly_return_year1996_cad
      t.integer :yearly_return_year1997_cad
      t.integer :yearly_return_year1998_cad
      t.integer :yearly_return_year1999_cad
      t.integer :yearly_return_year2000_cad
      t.integer :yearly_return_year2001_cad
      t.integer :yearly_return_year2002_cad
      t.integer :yearly_return_year2003_cad
      t.integer :yearly_return_year2004_cad
      t.integer :yearly_return_year2005_cad
      t.integer :yearly_return_year2006_cad
      t.integer :yearly_return_year2007_cad
      t.integer :yearly_return_year2008_cad
      t.integer :yearly_return_year2009_cad
      t.integer :yearly_return_year2010_cad
      t.integer :yearly_return_year2011_cad
      t.integer :yearly_return_year2012_cad
      t.integer :yearly_return_year2013_cad
      t.integer :yearly_return_year2014_cad
      t.integer :five
      t.integer :ten
      t.integer :fifteen
      t.integer :twenty
      t.integer :retirement
      
      t.timestamps null:false
    end
  end
end
