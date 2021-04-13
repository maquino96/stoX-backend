class WatchlistsController < ApplicationController

    def create
        @watchlist = Watchlist.create(user_id: params[:user_id], name: params[:name])

        @user = @watchlist.user
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol)} }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            watchlists: Hash[watchlists.zip(stocksInWatchlist)]
        }

        puts userRender

        if userRender
            render json: userRender
        else 
            render json: false
        end 
    end 

    def delete
        @watchlist = Watchlist.find(params[:id])
        @watchlist.destroy

        @user = @watchlist.user
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol)} }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            watchlists: Hash[watchlists.zip(stocksInWatchlist)]
        }

        puts userRender

        if userRender
            render json: userRender
        else 
            render json: false
        end 
    end 

end
