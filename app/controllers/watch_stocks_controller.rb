class WatchStocksController < ApplicationController

    def add
        @stock = Stock.create(stock_params)
        @watch_stock = WatchStock.create(watchlist_id: params[:id], stock_id: @stock.id)
        puts params

        if @watch_stock
            render json: @stock
        else
            redner json: false
        end 
    end 

    private 

    def stock_params
        params.permit(:companyName, :symbol, :description, :sector, :industry, :employees, :ceo, :exchange)
    end 

end
