class WatchStocksController < ApplicationController

    def add
        @stock = Stock.create(stock_params)
        @watch_stock = WatchStock.create(watchlist_id: params[:id], stock_id: @stock.id)
        
        @user = User.find_by(username: @watch_stock.watchlist.user.username)
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol)} }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            watchlists: Hash[watchlists.zip(stocksInWatchlist)]
        }

        if @watch_stock
            render json: userRender
        else
            redner json: false
        end 
    end 

    private 

    def stock_params
        params.permit(:companyName, :symbol, :description, :sector, :industry, :employees, :ceo, :exchange)
    end 

end
