class StocksController < ApplicationController

    def show 
        client = IEX::Api::Client.new
        stockapi = client.company(params[:symbol])
        # @stock = Stock.create(companyName: stockapi.company_name, 
        #                         symbol: stockapi.symbol, 
        #                         description: stockapi.description, 
        #                         sector: stockapi.sector, 
        #                         industry: stockapi.industry, 
        #                         employees: stockapi.employees, 
        #                         ceo: stockapi.ceo, 
        #                         exchange: stockapi.exchange)
        if stockapi 
            render json: stockapi
        else 
            render json: false
        end 
    end 

    def data
        client = IEX::Api::Client.new
        stockapi = client.key_stats(params[:symbol])
        if stockapi 
            render json: stockapi
        else 
            render json: false
        end 
    end 

    def similar

        response = HTTParty.get("https://api.polygon.io/v1/meta/symbols/#{params[:symbol]}/company?&apiKey=#{ENV['polygon_key']}")
        
        similar = { similar: response['similar'], string: response['similar'].join(",") }
        if similar 
            render json: similar
        else 
            render json: false
        end 
    end 

    def batch
        client = IEX::Api::Client.new()
        results = client.get("/stock/market/batch?symbols=#{params[:symbols]}&types=quote", token: ENV['iex_publish'])
        if results 
            render json: results
        else 
            render json: false
        end 
    end 

    def chart
        client = IEX::Api::Client.new()
        data = client.get("/stock/#{params[:symbol]}/intraday-prices/chartIEXOnly=true", token: ENV['iex_publish'])
        chartRender = { 
            minutesX: data.map{ |point| point['minute'] },
            averageY: data.map{ |point| point['average'] },
            volumeY: data.map{ |point| point['volume'] }
        }
        # puts chartRender
        if chartRender 
            render json: chartRender
        else
            render json: false
        end 
    end 


end
