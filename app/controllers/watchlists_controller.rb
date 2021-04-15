class WatchlistsController < ApplicationController

    def index
        
        publicList = Watchlist.all.select{|element| element.public }.map{ |watchlist| {
            id: watchlist.id,
            user: watchlist.user.username,
            name: watchlist.name,
            upvotes: watchlist.upvotes, 
            description: watchlist.description,
            arrayList: watchlist.stocks.pluck(:symbol), 
            createdAt: watchlist.created_at.to_i,
            updatedAt: watchlist.updated_at.to_i
        }}

        if publicList 
            render json: publicList
        else
            render json: false
        end 

    end 

    def create
        @watchlist = Watchlist.create(user_id: params[:user_id], name: params[:name], description: params[:description], public: params[:public])

        @user = @watchlist.user
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol), upvotes: watchlist.upvotes, public: watchlist.public, description: watchlist.description} }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            loadwatchlist: @user.onLoadWatchlist,
            watchlists: Hash[watchlists.zip(stocksInWatchlist)]
        }

        puts userRender

        if userRender
            render json: userRender
        else 
            render json: false
        end 
    end 

    def update

        @watchlist = Watchlist.find(params[:id])
        # byebug
        @watchlist.update(name: params[:name], description: params[:description], public: params[:public] )

        @user = @watchlist.user
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol), upvotes: watchlist.upvotes, public: watchlist.public, description: watchlist.description} }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            loadwatchlist: @user.onLoadWatchlist,
            watchlists: Hash[watchlists.zip(stocksInWatchlist)]
        }
        
        if userRender
            render json: userRender
        else 
            render json: false
        end 

    end 

    def upvote
        @watchlist = Watchlist.find(params[:id])
        @watchlist.update(upvotes: (@watchlist.upvotes + 1))

        @user = @watchlist.user
        watchlists = @user.watchlists.pluck(:name)
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol), upvotes: watchlist.upvotes, public: watchlist.public, description: watchlist.description} }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            loadwatchlist: @user.onLoadWatchlist,
            watchlists: Hash[watchlists.zip(stocksInWatchlist)]
        }
        
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
        stocksInWatchlist = @user.watchlists.map{ |watchlist| {id: watchlist.id, arrayList: watchlist.stocks.pluck(:symbol), upvotes: watchlist.upvotes, public: watchlist.public, description: watchlist.description} }

        userRender = { 
            id: @user.id, 
            name: @user.username,
            loadwatchlist: @user.onLoadWatchlist,
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
