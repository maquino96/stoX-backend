class Watchlist < ApplicationRecord
  belongs_to :user
  has_many :watch_stocks, dependent: :destroy
  has_many :stocks, through: :watch_stocks
  validates :name, presence: true 

end
