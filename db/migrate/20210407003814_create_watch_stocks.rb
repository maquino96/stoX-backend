class CreateWatchStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :watch_stocks do |t|
      t.belongs_to :watchlist, null: false, foreign_key: true
      t.belongs_to :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
