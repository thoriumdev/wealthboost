class AssetClass < ActiveRecord::Base
  def self.get_asset_score(sec)
    asset_class = sec.asset_class
    asset_class.downcase!
    asset_class.gsub!(' ', '')
    asset_class.gsub!('-','_')
    asset_class.gsub!(/[()]/,'')
    asset_score_obj = AssetClass.where("asset_class = '#{asset_class}'")[0]
    Security.rank_all_sec(sec, asset_score_obj)
  end
end