class WatchStocksController < ApplicationController

    def add

        if Stock.find_by(symbol: params[:symbol])
            @stock=Stock.find_by(symbol: params[:symbol])
        else 
            @stock = Stock.create(stock_params)
        end

        @watch_stock = WatchStock.create(watchlist_id: params[:id], stock_id: @stock.id)
        
        @user = User.find_by(username: @watch_stock.watchlist.user.username)
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol), upvotes: watchlist.upvotes, public: watchlist.public, description: watchlist.description} }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            loadwatchlist: @user.onLoadWatchlist,
            watchlists: Hash[watchlists.zip(stocksInWatchlist)]
        }

        if @watch_stock
            render json: userRender
        else
            redner json: false
        end 
    end 

    def delete
        @stock = Stock.find_by(symbol: params[:symbol])
        @watch_stock = WatchStock.select{ |instance| (instance.watchlist_id == params[:list].to_i && instance.stock_id == @stock.id) }[0]

        # byebug

        @watch_stock.destroy

        @user = User.find_by(username: @watch_stock.watchlist.user.username)
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol), upvotes: watchlist.upvotes, public: watchlist.public, description: watchlist.description} }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            loadwatchlist: @user.onLoadWatchlist,
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
