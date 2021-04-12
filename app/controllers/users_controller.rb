class UsersController < ApplicationController

    def signup 
        @user = User.create(username: params[:name], password: params[:password])
        @watchlist = Watchlist.create( user_id: @user.id, name: 'default')
        
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol)} }

        # {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol)}

        userRender = { 
            id: @user.id, 
            name: @user.username,
            watchlists: Hash[watchlists.zip(stocksInWatchlist)]
        }
        
        if @user.valid?
            render json: userRender
        else 
            render json: false
        end 
    end 

    def login 
        
        @user = User.find_by(username: params[:name])
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol)} }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            watchlists: Hash[watchlists.zip(stocksInWatchlist)]
        }

        puts userRender

        if @user.authenticate(params[:password])
                render json: userRender
        else
                render json: false
        end  
    end

end
