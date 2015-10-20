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

ActiveRecord::Schema.define(version: 20151019215022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "markets_tables", force: :cascade do |t|
    t.string   "ticker"
    t.string   "fund_name"
    t.string   "tot_asset_m"
    t.string   "asset_class_broad"
    t.string   "geographic_focus_revised"
    t.string   "expense_ratio"
    t.string   "asset_all__equity"
    t.integer  "yearly_return_year1993_cad"
    t.integer  "yearly_return_year1994_cad"
    t.integer  "yearly_return_year1995_cad"
    t.integer  "yearly_return_year1996_cad"
    t.integer  "yearly_return_year1997_cad"
    t.integer  "yearly_return_year1998_cad"
    t.integer  "yearly_return_year1999_cad"
    t.integer  "yearly_return_year2000_cad"
    t.integer  "yearly_return_year2001_cad"
    t.integer  "yearly_return_year2002_cad"
    t.integer  "yearly_return_year2003_cad"
    t.integer  "yearly_return_year2004_cad"
    t.integer  "yearly_return_year2005_cad"
    t.integer  "yearly_return_year2006_cad"
    t.integer  "yearly_return_year2007_cad"
    t.integer  "yearly_return_year2008_cad"
    t.integer  "yearly_return_year2009_cad"
    t.integer  "yearly_return_year2010_cad"
    t.integer  "yearly_return_year2011_cad"
    t.integer  "yearly_return_year2012_cad"
    t.integer  "yearly_return_year2013_cad"
    t.integer  "yearly_return_year2014_cad"
    t.integer  "five"
    t.integer  "ten"
    t.integer  "fifteen"
    t.integer  "twenty"
    t.integer  "retirement"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
