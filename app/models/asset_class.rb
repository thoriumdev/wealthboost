class AssetClass < ActiveRecord::Base
  def self.get_asset_score(sec)
    asset_class = sec.asset_class
    geo_area = sec.geo_area
    asset_class.downcase!
    geo_area.downcase!
    asset_class.gsub!(' ', '')
    asset_class.gsub!('-','_')
    geo_area.gsub!(' ', '_')
    asset_class.gsub!(/[()]/,'')
    asset_score_obj = AssetClass.where("asset_class = '#{asset_class}'")[0]
    geo_area_obj = GeoScore.where("geo_location = '#{geo_area}'")[0]
    Security.rank_all_sec(sec, asset_score_obj, geo_area_obj)
  end
end