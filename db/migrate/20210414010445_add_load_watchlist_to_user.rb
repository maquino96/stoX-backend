class AddLoadWatchlistToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :onLoadWatchlist, :string, :default => 'Default'
  end
end
