class ChangeDataTypesInMarkets < ActiveRecord::Migration
  def change
    change_column :markets, :total_assets, 'decimal USING CAST(total_assets AS decimal)'
    change_column :markets, :expense_ratio, 'decimal USING CAST(expense_ratio AS decimal)' 
    change_column :markets, :asset_all_equity, 'decimal USING CAST(asset_all_equity AS decimal)'
    change_column :markets, :yearly_return_year1993_cad, 'decimal USING CAST(yearly_return_year1993_cad AS decimal)'
    change_column :markets, :yearly_return_year1994_cad, 'decimal USING CAST(yearly_return_year1994_cad AS decimal)'
    change_column :markets, :yearly_return_year1995_cad, 'decimal USING CAST(yearly_return_year1995_cad AS decimal)'
    change_column :markets, :yearly_return_year1996_cad, 'decimal USING CAST(yearly_return_year1996_cad AS decimal)'
    change_column :markets, :yearly_return_year1997_cad, 'decimal USING CAST(yearly_return_year1997_cad AS decimal)'
    change_column :markets, :yearly_return_year1998_cad, 'decimal USING CAST(yearly_return_year1998_cad AS decimal)'
    change_column :markets, :yearly_return_year1999_cad, 'decimal USING CAST(yearly_return_year1999_cad AS decimal)'
    change_column :markets, :yearly_return_year2000_cad, 'decimal USING CAST(yearly_return_year2000_cad AS decimal)'
    change_column :markets, :yearly_return_year2001_cad, 'decimal USING CAST(yearly_return_year2001_cad AS decimal)'
    change_column :markets, :yearly_return_year2002_cad, 'decimal USING CAST(yearly_return_year2002_cad AS decimal)'
    change_column :markets, :yearly_return_year2003_cad, 'decimal USING CAST(yearly_return_year2003_cad AS decimal)'
    change_column :markets, :yearly_return_year2004_cad, 'decimal USING CAST(yearly_return_year2004_cad AS decimal)'
    change_column :markets, :yearly_return_year2005_cad, 'decimal USING CAST(yearly_return_year2005_cad AS decimal)'
    change_column :markets, :yearly_return_year2006_cad, 'decimal USING CAST(yearly_return_year2006_cad AS decimal)'
    change_column :markets, :yearly_return_year2007_cad, 'decimal USING CAST(yearly_return_year2007_cad AS decimal)'
    change_column :markets, :yearly_return_year2008_cad, 'decimal USING CAST(yearly_return_year2008_cad AS decimal)'
    change_column :markets, :yearly_return_year2009_cad, 'decimal USING CAST(yearly_return_year2009_cad AS decimal)'
    change_column :markets, :yearly_return_year2010_cad, 'decimal USING CAST(yearly_return_year2010_cad AS decimal)'
    change_column :markets, :yearly_return_year2011_cad, 'decimal USING CAST(yearly_return_year2011_cad AS decimal)'
    change_column :markets, :yearly_return_year2012_cad, 'decimal USING CAST(yearly_return_year2012_cad AS decimal)'
    change_column :markets, :yearly_return_year2013_cad, 'decimal USING CAST(yearly_return_year2013_cad AS decimal)'
    change_column :markets, :yearly_return_year2014_cad, 'decimal USING CAST(yearly_return_year2014_cad AS decimal)'
    change_column :markets, :five, 'decimal USING CAST(five AS decimal)'
    change_column :markets, :ten, 'decimal USING CAST(ten AS decimal)'
    change_column :markets, :fifteen, 'decimal USING CAST(fifteen AS decimal)'
    change_column :markets, :twenty, 'decimal USING CAST(twenty AS decimal)'
  end
end