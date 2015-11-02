class Market < ActiveRecord::Base
  has_many :securities
  
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
    Market.all.each do |sec|
      sec.ticker.upcase!
      sec.asset_class.downcase!
      sec.asset_class.gsub!(' ', '')
      sec.asset_class.gsub!('-', '_')
      sec.asset_class.gsub!(/[()]/,'')
      sec.save!
    end
  end
  
  def self.look_up_asset_class(ticker)
    ticker.upcase!
    obj = Market.where("ticker = '#{ticker}'")[0]
    score = AssetClass.get_asset_score(obj)
  end
  
  def self.all_sec
    Market.find_each do |obj|
      ticker = obj.ticker.upcase
      new_obj = Market.where("ticker = '#{ticker}'")[0]
      AssetClass.get_asset_score(new_obj)
    end
  end
end