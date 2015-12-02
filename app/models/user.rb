class User < ActiveRecord::Base
    has_many :accounts
    has_many :investments
    has_many :projections
    has_many :wealth_boosts
end