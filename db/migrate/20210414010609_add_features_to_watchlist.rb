class AddFeaturesToWatchlist < ActiveRecord::Migration[6.1]
  def change
    add_column :watchlists, :description, :string
    add_column :watchlists, :upvotes, :integer, :default => 0
    add_column :watchlists, :public, :boolean
  end
end
