class Stock < ApplicationRecord
    has_many :watch_stocks
    has_many :users, through: :watch_stocks 
end
