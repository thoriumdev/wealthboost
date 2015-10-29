class Market < ActiveRecord::Base
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      data_hash = row.to_hash
      new_hash = Hash.new()
      data_hash.each do |key, value|
        new_key = key.downcase.gsub(/[^0-9a-z ]/i, '').strip
        new_key.gsub!(' ', '_')
        new_hash[new_key] = value
      end
      mappings = {
        "ticker" => "ticker",
         "fund_name" => "fund_name",
         "tot_asset_m" => "total_assets",
         "asset_class_broad" => "asset_class",
         "geographic_focus_revised" => "geo_area",
         "expense_ratio" => "expense_ratio",
         "asset_all__equity" => "asset_all_equity",
         "yearly_return_year1993_cad" => "yearly_return_year1993_cad",
         "yearly_return_year1994_cad" => "yearly_return_year1994_cad",
         "yearly_return_year1995_cad" => "yearly_return_year1995_cad",
         "yearly_return_year1996_cad" => "yearly_return_year1996_cad",
         "yearly_return_year1997_cad" => "yearly_return_year1997_cad",
         "yearly_return_year1998_cad" => "yearly_return_year1998_cad",
         "yearly_return_year1999_cad" => "yearly_return_year1999_cad",
         "yearly_return_year2000_cad" => "yearly_return_year2000_cad",
         "yearly_return_year2001_cad" => "yearly_return_year2001_cad",
         "yearly_return_year2002_cad" => "yearly_return_year2002_cad",
         "yearly_return_year2003_cad" => "yearly_return_year2003_cad",
         "yearly_return_year2004_cad" => "yearly_return_year2004_cad",
         "yearly_return_year2005_cad" => "yearly_return_year2005_cad",
         "yearly_return_year2006_cad" => "yearly_return_year2006_cad",
         "yearly_return_year2007_cad" => "yearly_return_year2007_cad",
         "yearly_return_year2008_cad" => "yearly_return_year2008_cad",
         "yearly_return_year2009_cad" => "yearly_return_year2009_cad",
         "yearly_return_year2010_cad" => "yearly_return_year2010_cad",
         "yearly_return_year2011_cad" => "yearly_return_year2011_cad",
         "yearly_return_year2012_cad" => "yearly_return_year2012_cad",
         "yearly_return_year2013_cad" => "yearly_return_year2013_cad",
         "yearly_return_year2014_cad" => "yearly_return_year2014_cad",
         "5" => "five",
         "10" => "ten",
         "15" => "fifteen",
         "20" => "twenty",
         "retirement" => "retirement"
      }
      final_hash = Hash[new_hash.map { |k, v| [mappings[k], v]}]
      Market.find_or_create_by!(final_hash)
    end
  end
  
  def look_up_asset_class(ticker)
    ticker = "BXF"
    obj = Market.where("ticker = '#{ticker}'")[0]
    asset_class = obj.asset_class
    asset_class.downcase!
    asset_class.gsub!(' ', '')
    asset_class.gsub!('-','_')
  end
  
  def self.all_etf
    Market.find_each do |obj|
      ticker = obj.ticker.upcase
      new_obj = Market.where("ticker = '#{ticker}'")[0]
      asset_class = new_obj.asset_class
    end
  end
end












