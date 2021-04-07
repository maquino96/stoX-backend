class WatchStockSerializer < ActiveModel::Serializer
  attributes :id
  has_one :watchlist
  has_one :stock
end
