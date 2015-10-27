# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

a = "10	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0"
b =	"0	10	0	6	0	0	0	10	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0"
c = "0	0	10	0	0	0	0	6	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0"
d = "0	0	0	10	0	7	0	6	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0"
e = "0	0	0	0	10	0	0	6	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0"
f = "0	0	0	7	0	10	0	6	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0"
g = "0	0	0	0	0	0	10	6	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0"
h = "0	0	0	0	0	0	0	10	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0"
i = "0	0	0	0	0	0	0	6	10	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0"
j = "0	0	0	0	0	0	0	0	0	10	0	10	0	0	0	0	0	0	0	0	0	0	6	0	0	0"
k = "0	0	0	0	0	0	0	0	0	8	10	8	0	8	0	0	0	0	0	0	0	0	6	0	0	0"
l = "0	0	0	0	0	0	0	0	0	10	0	10	0	0	0	0	0	0	0	0	0	0	6	0	0	0"
m = "0	0	0	0	0	0	0	0	0	0	0	0	10	0	0	0	0	0	0	0	0	0	6	0	0	0"
n = "0	0	0	0	0	0	0	0	0	0	6	0	0	10	0	0	0	0	0	0	0	0	6	0	0	0"
o = "0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	0	0	0	0	0	0	0	6	0	0	0"
q = "0	0	0	0	0	0	0	0	0	0	0	0	6	0	0	10	0	0	0	0	0	0	6	0	0	0"
r = "0	0	0	0	0	0	0	0	0	0	0	0	6	0	0	0	10	0	0	0	0	0	6	0	0	0"
s = "0	0	0	0	0	0	0	0	0	0	0	0	6	0	0	0	0	10	0	0	0	0	6	0	0	0"
t = "0	0	0	0	0	0	0	0	0	0	0	0	6	0	0	0	0	0	10	0	0	0	6	0	0	0"
u = "0	0	0	0	0	0	0	0	0	6	0	6	0	0	0	0	0	0	0	10	0	0	6	0	0	0"
v = "0	0	0	0	0	0	0	0	0	6	0	6	0	0	0	0	0	0	0	0	10	0	6	0	0	0"
w = "0	0	0	0	0	0	0	0	0	6	0	6	0	0	0	0	0	0	0	0	0	10	6	0	0	0"
x = "0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	0	0	0"
y = "0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	6	10	0	0"
z = "0 0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10	0"
aa = "0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	10"

seed_arr = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, q, r, s, t, u, v, w, x, y, z, aa]
attr_arr = AssetClass.attribute_names
attr_arr.shift(2)
attr_arr.pop(2)

seed_arr.each do |v|
  value_arr = v.split("\t")
  seed_hash = Hash.new()
  attr_arr.each_with_index do |item, index|
    seed_hash[item] = value_arr[index]
  end
  AssetClass.create!(seed_hash)
end

AssetClass.all.each_with_index do |obj, index|
  obj.asset_class = attr_arr[index]
  obj.save!
end

bb = "10	0	6	0	0	6	0	0	0	0	0	0"
cc = "0	10	0	0	0	0	0	6	0	0	0	0"
dd = "0	0	10	0	0	6	0	0	0	0	0	0"
ee = "0	0	0	10	0	6	0	0	0	0	0	0"
ff = "0	0	6	0	10	6	0	0	0	0	0	0"
gg = "0	0	0	0	0	10	0	0	0	0	0	0"
hh = "0	0	0	0	0	6	10	0	0	0	0	0"
ii = "0	6	0	0	0	0	0	10	6	0	0	0"
jj = "0	0	0	0	0	0	0	6	10	0	0	0"
kk = "0	0	6	0	0	6	0	0	0	10	0	0"
ll = "0	0	0	0	0	6	0	0	0	0	10	0"
mm = "0	0	0	0	0	6	0	0	0	0	0	10"

geo_seed_arr = [bb, cc, dd, ee, ff, gg, hh, ii, jj, kk, ll, mm]
geo_attr_arr = GeoScore.attribute_names
geo_attr_arr.shift(1)

geo_seed_arr.each do |v|
  geo_value_arr = v.split("\t")
  geo_seed_hash = Hash.new()
  geo_attr_arr.each_with_index do |item, index|
    geo_seed_hash[item] = geo_value_arr[index]
  end
  GeoScore.create!(geo_seed_hash)
end

GeoScore.all.each_with_index do |obj, index|
  obj.geo_location = geo_attr_arr[index]
  obj.save!
end