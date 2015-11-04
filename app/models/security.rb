class Security < ActiveRecord::Base
  belongs_to :market
  
  def self.rank_all_sec(sec_obj, asset_class_obj, geo_area_obj)
    Market.all.each do |sec|
      ticker = sec.ticker.upcase
      sec_obj_compare = Market.where("ticker = '#{ticker}'")[0]
      sec_obj_compare_asset_score = sec_obj_compare.asset_class.to_sym
      sec_obj_compare_geo_score = sec_obj_compare.geo_area.to_sym
      asset_class_score = asset_class_obj.send(sec_obj_compare_asset_score)
      geo_area_score = geo_area_obj.send(sec_obj_compare_geo_score)
      new_obj = sec_obj.securities.create!(security: sec_obj_compare.ticker, asset_class_score: asset_class_score, expense_ratio: sec_obj_compare.expense_ratio, total_assets: sec_obj_compare.total_assets, geo_area_score: geo_area_score, total_score: asset_class_score + geo_area_score.to_i, asset_class: sec_obj_compare.asset_class)
    end
  end
  
  def self.generate_recommendations(sec)
    sec.securities.where('total_score >= 16').order(expense_ratio: :asc, total_assets: :desc).limit(2)
  end
  
  def self.generate_last_recommendation(sec)
    sec.securities.where("asset_class = '#{sec.asset_class}'").order(expense_ratio: :asc, total_assets: :desc).limit(1)
  end
end
# a = GeoScore.attribute_names
# a.shift(1)
# a.pop(3)
# GeoScore.all.each_with_index do |item, index|
#   item.geo_location = a[index]
#   item.save!
# end
