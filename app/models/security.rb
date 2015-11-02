class Security < ActiveRecord::Base  
def self.rank_all_sec(sec_obj, asset_class_obj)
  start_counter = 2
  batch_size_counter = 4800
  Market.find_in_batches(start: start_counter, batch_size: batch_size_counter) do |group|
    group.each do |sec|
      ticker = sec.ticker.upcase
      sec_obj_compare = Market.where("ticker = '#{ticker}'")[0]
      sec_obj_compare_attr = sec_obj_compare.asset_class.to_sym
      score = asset_class_obj.send(sec_obj_compare_attr)
      new_obj = sec_obj.securities.create!(security: sec_obj_compare.ticker, asset_class_score: score)
    end
  start_counter += 1
  batch_size_counter -= 1
  end
end
end