# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151104212336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asset_classes", force: :cascade do |t|
    t.string   "asset_class"
    t.integer  "commodities_agriculture"
    t.integer  "commodities_gold"
    t.integer  "commodities_naturalgas"
    t.integer  "commodities_oil"
    t.integer  "commodities_preciousmetals"
    t.integer  "commodities_silver"
    t.integer  "commodities_broad"
    t.integer  "equities"
    t.integer  "equities_dividendyield"
    t.integer  "equities_midcap"
    t.integer  "equities_realestate"
    t.integer  "equities_smallcap"
    t.integer  "equities_energy"
    t.integer  "equities_broad"
    t.integer  "equities_naturalresources"
    t.integer  "fixedincome_corporate"
    t.integer  "fixedincome_corporatehighyield"
    t.integer  "fixedincome_corporateinvestmentgrade"
    t.integer  "fixedincome_government"
    t.integer  "fixedincome_highyield"
    t.integer  "fixedincome_mortgage"
    t.integer  "fixedincome_governmentinflationprotected"
    t.integer  "fixedincome_governmentshortduration"
    t.integer  "fixedincome_governmentintermediateduration"
    t.integer  "fixedincome_governmentlongduration"
    t.integer  "fixedincome_corporateshortduration"
    t.integer  "fixedincome_corporateintermediateduration"
    t.integer  "fixedincome_corporatelongduration"
    t.integer  "fixedincome_multi_assetclass"
    t.integer  "fixedincome_municipal"
    t.integer  "multi_assetclass"
    t.integer  "alternativeinvestments"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "geo_scores", force: :cascade do |t|
    t.string   "asia"
    t.string   "canada"
    t.string   "eafe"
    t.string   "emerging_markets"
    t.string   "europe"
    t.string   "global"
    t.string   "latin_america"
    t.string   "north_america"
    t.string   "united_states"
    t.string   "africa"
    t.string   "australia"
    t.string   "middle_east"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "geo_location"
  end

  create_table "markets", force: :cascade do |t|
    t.string   "ticker"
    t.string   "fund_name"
    t.decimal  "total_assets"
    t.string   "asset_class"
    t.string   "geo_area"
    t.decimal  "expense_ratio"
    t.decimal  "asset_all_equity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "securities", force: :cascade do |t|
    t.string   "security"
    t.integer  "asset_class_score"
    t.integer  "geo_area_score"
    t.integer  "market_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "compared_to_security"
    t.decimal  "expense_ratio"
    t.decimal  "total_assets"
    t.integer  "total_score"
    t.string   "asset_class"
  end

end
