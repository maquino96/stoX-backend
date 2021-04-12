class WatchStockSerializer < ActiveModel::Serializer
  attributes :id, :stock_id, :watchlist_id
  has_one :watchlist
  has_one :stock
end
