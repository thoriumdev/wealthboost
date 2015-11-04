class GeoScore < ActiveRecord::Base
  # def self.get_geo_score(sec)
  #   sec.geo_area.downcase!
  #   sec.geo_area.gsub!(' ', '_')
  #   geo_score_obj = GeoScore.where("geo_location = '#{sec.geo_area}'")[0]
  #   Security.rank_by_geo_score(sec, geo_score_obj)
  # end
end