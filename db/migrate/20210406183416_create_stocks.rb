class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :symbol
      t.string :address
      t.string :fiftyDayMovingAverage
      t.string :fiftyTwoWeekHigh
      t.string :fiftyTwoWeekLow
      t.string :twoHundredDayMovingAverage
      t.string :bookValue
      t.string :description
      t.string :dividendPerShare
      t.string :dividendYield
      t.string :ebitda
      t.string :eps
      t.string :fullTimeEmployees
      t.string :grossPorditTTM
      t.string :industry
      t.string :marketCapitalization
      t.string :peRatio
      t.string :percentInsiders
      t.string :percentInstitutions
      t.string :priceToBookRatio
      t.string :priceToSalesRatio
      t.string :profitMargin
      t.string :revenueTTM
      t.string :sector
      t.string :sharesFloat
      t.string :sharesOutstanding
      t.string :sharesShort
      t.string :sharesShortPriorMonth
      t.string :shortPercentFloat
      t.string :shortPercentOutstanding
      t.string :shortRatio
      t.string :trailingPE

      t.timestamps
    end
  end
end
