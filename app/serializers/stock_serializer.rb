class StockSerializer < ActiveModel::Serializer
  attributes :id, :name, :symbol, :address, :"50DayMovingAverage", :"52WeekHigh", :"52WeekLow", :"200DayMovingAverage", :bookValue, :description, :dividendPerShare, :dividendYield, :ebitda, :eps, :fullTimeEmployees, :grossPorditTTM, :industry, :marketCapitalization, :peRatio, :percentInsiders, :percentInstitutions, :priceToBookRatio, :priceToSalesRatio, :profitMargin, :revenueTTM, :sector, :sharesFloat, :sharesOutstanding, :sharesShort, :sharesShortPriorMonth, :shortPercentFloat, :shortPercentOutstanding, :shortRatio, :trailingPE
end
