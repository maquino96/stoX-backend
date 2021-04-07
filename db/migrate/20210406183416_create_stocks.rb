class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :companyName
      t.string :symbol
      t.string :description
      t.string :sector 
      t.string :industry
      t.string :employees
      t.string :ceo
      t.string :exchange

      t.timestamps
    end
  end
end
