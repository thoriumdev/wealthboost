class User < ActiveRecord::Base
    has_many :accounts
    has_many :investments
end