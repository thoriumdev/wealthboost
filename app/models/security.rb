class Security < ActiveRecord::Base
  def self.rank_all_sec(sec_obj, asset_class_obj)
    Market.find_each do |sec|
      ticker = sec.ticker.upcase
      sec_obj_compare = Market.where("ticker = '#{ticker}'")[0]
      sec_obj_compare_attr = sec_obj_compare.asset_class.to_sym
      score = asset_class_obj.send(sec_obj_compare_attr)
      new_obj = sec_obj.securities.create!(security: sec_obj_compare.ticker, asset_class_score: score)
    end
  end
end