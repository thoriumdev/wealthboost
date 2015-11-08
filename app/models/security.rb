class Security < ActiveRecord::Base
  belongs_to :market
  
  def self.rank_all_sec(sec_obj, asset_class_obj, geo_area_obj)
    inserts = []
    Market.all.each do |sec|
      if sec_obj.asset_class == "multi_assetclass"
        asset_allocation = sec_obj.asset_all_equity.to_f - sec.asset_all_equity.to_f
        absolute_value_asset_allocation = asset_allocation.abs
        asset_class_score = 10 - (0.1 * absolute_value_asset_allocation)
        ticker = sec.ticker.upcase
        sec_obj_compare = Market.where("ticker = '#{ticker}'")[0]
        sec_obj_compare_geo_score = sec_obj_compare.geo_area.to_sym
        geo_area_score = geo_area_obj.send(sec_obj_compare_geo_score)
        
        inserts.push "('#{sec_obj_compare.ticker}', #{asset_class_score}, #{sec_obj_compare.expense_ratio}, #{sec_obj_compare.total_assets}, #{geo_area_score}, #{asset_class_score + geo_area_score.to_i}, '#{sec_obj_compare.asset_class}', #{sec_obj.id}, '#{sec.created_at}', '#{sec.updated_at}')"
        # new_obj = sec_obj.securities.create!(security: sec_obj_compare.ticker, asset_class_score: asset_class_score, expense_ratio: sec_obj_compare.expense_ratio, total_assets: sec_obj_compare.total_assets, geo_area_score: geo_area_score, total_score: asset_class_score + geo_area_score.to_i, asset_class: sec_obj_compare.asset_class)
      else
        ticker = sec.ticker.upcase
        sec_obj_compare = Market.where("ticker = '#{ticker}'")[0]
        sec_obj_compare_asset_score = sec_obj_compare.asset_class.to_sym
        sec_obj_compare_geo_score = sec_obj_compare.geo_area.to_sym
        asset_class_score = asset_class_obj.send(sec_obj_compare_asset_score)
        geo_area_score = geo_area_obj.send(sec_obj_compare_geo_score)
        
        inserts.push "('#{sec_obj_compare.ticker}', #{asset_class_score}, #{sec_obj_compare.expense_ratio}, #{sec_obj_compare.total_assets}, #{geo_area_score}, #{asset_class_score + geo_area_score.to_i}, '#{sec_obj_compare.asset_class}', #{sec_obj.id}, '#{sec.created_at}', '#{sec.updated_at}')"
        # sql = "INSERT INTO securities ('security', 'asset_class_score','expense_ratio', 'total_assets', 'geo_area_score', 'total_score', 'asset_class', 'market_id') VALUES #{inserts.join(", ")}"
        
        # new_obj = sec_obj.securities.create!(security: sec_obj_compare.ticker, asset_class_score: asset_class_score, expense_ratio: sec_obj_compare.expense_ratio, total_assets: sec_obj_compare.total_assets, geo_area_score: geo_area_score, total_score: asset_class_score + geo_area_score.to_i, asset_class: sec_obj_compare.asset_class)
      end
    end
    sql = "INSERT INTO securities (security, asset_class_score, expense_ratio, total_assets, geo_area_score, total_score, asset_class, market_id, created_at, updated_at) VALUES #{inserts.join(", ")}"
    ActiveRecord::Base.connection.execute(sql)
  end
  
  def self.generate_recommendations(sec)
    sec.securities.where('total_score >= 16').order(expense_ratio: :asc, total_assets: :desc).limit(2)
  end
  
  def self.generate_last_recommendation(sec)
    binding.pry
    if sec.asset_class == "multi_assetclass" && sec.geo_area == "united_states"
      schb = Market.where("ticker = 'SCHB'")[0]
      schz = Market.where("ticker = 'SCHZ'")[0]
      return [schb, schz]
    elsif sec.asset_class == "multi_assetclass" && sec.geo_area == "canada"
      hxt = Market.where("ticker = 'HXT'")[0]
      xqb = Market.where("ticker = 'XQB'")[0]
      return [hxt, xqb]
    elsif sec.asset_class[0, 11] == "commodities"
      sec.securities.where("asset_class = 'commodities_broad'").order(expense_ratio: :asc, total_assets: :desc).limit(1)[0]
    elsif sec.asset_class[0, 8] == "equities"
      sec.securities.where("asset_class = 'equities_broad'").order(expense_ratio: :asc, total_assets: :desc).limit(1)[0]
    elsif sec.asset_class[0, 11] == "fixedincome"
      sec.securities.where("asset_class = 'fixedincome_multi_assetclass'").order(expense_ratio: :asc, total_assets: :desc).limit(1)[0]
    end
  end
end