class UsersController < ApplicationController

    def login 
        
        @user = User.find_by(username: params[:name])
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| watchlist.stocks.pluck(:symbol) }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            watchlists: Hash[watchlists.zip(stocksInWatchlist)]
        }

        if @user.authenticate(params[:password])
                render json: userRender
        else
                render json: false
        end  
    end

end
