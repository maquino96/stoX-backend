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

end
