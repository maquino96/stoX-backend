class StockSerializer < ActiveModel::Serializer
  attributes :id, :companyName, :symbol, :description, :sector, :industry, :employees, :ceo, :exchange
end
