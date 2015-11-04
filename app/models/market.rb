class Market < ActiveRecord::Base
  has_many :securities
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      data_hash = row.to_hash
      new_hash = Hash.new()
      data_hash.each do |key, value|
        new_key = key.downcase.gsub(/[^0-9a-z ]/i, '').strip
        new_key.gsub!(' ', '_')
        if value == "N.A." || value == "#N/A"
          value = 0
        end
        if value.to_f > 0
          new_hash[new_key] = value.to_f
        else
          new_hash[new_key] = value
        end
      end
      mappings = {
        "ticker" => "ticker",
         "fund_name" => "fund_name",
         "tot_asset_m" => "total_assets",
         "asset_class_broad" => "asset_class",
         "geographic_focus_revised" => "geo_area",
         "expense_ratio" => "expense_ratio",
         "asset_all__equity" => "asset_all_equity"
      }
      final_hash = Hash[new_hash.map { |k, v| [mappings[k], v]}]
      Market.find_or_create_by!(final_hash)
    end
    Market.all.each do |sec|
      sec.ticker.upcase!
      sec.asset_class.downcase!
      sec.geo_area.downcase!
      sec.geo_area.gsub!(' ', '_')
      sec.asset_class.gsub!(' ', '')
      sec.asset_class.gsub!('-', '_')
      sec.asset_class.gsub!(/[()]/,'')
      sec.save!
    end
  end
  
  def self.first_two_recommendations(ticker)
    ticker.upcase!
    sec = Market.where("ticker = '#{ticker}'")[0]
    Security.generate_recommendations(sec)
  end
  
  def self.last_recommendation(ticker)
    ticker.upcase!
    sec = Market.where("ticker = '#{ticker}'")[0]
    Security.generate_last_recommendation(sec)
  end
  
  def self.all_sec
    Market.all.each do |sec|
      AssetClass.get_asset_score(sec)
    end
  end
end