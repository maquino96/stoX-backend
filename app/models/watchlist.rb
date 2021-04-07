class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :watch_stocks
  has_many :stocks, through: :watch_stocks
end
