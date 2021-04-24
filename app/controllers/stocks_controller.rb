class StocksController < ApplicationController

    def show 
        client = IEX::Api::Client.new
            stockapi = client.company(params[:symbol])
           
        if 
            render json: stockapi
        else 
            render json: false
        end 

    end 

    def alt
        alternate = HTTParty.get("https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=#{params[:symbol]}&apikey=#{ENV['alphavantage_key']}")
        # byebug
        altArray = alternate['bestMatches'].map{ |obj|  obj['1. symbol'] }
        
        if altArray
            render json: altArray
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
            line: {
                minutesX: data.map{ |point| point['label']},
                averageY: data.map{ |point| point['average'] },
                volumeY: data.map{ |point| point['volume'] }
            },
            candle: {
                x: data.map{ |p| p['label']},
                close: data.map{ |p| p['close']},
                high: data.map{ |p| p['high']},
                low: data.map{ |p| p['low']},
                open: data.map{ |p| p['open']}
            }
        }
        # puts chartRender
        if chartRender 
            render json: chartRender
        else
            render json: false
        end 
    end
    
    def treemap
        client = IEX::Api::Client.new()
        results = client.get("/stock/market/batch?symbols=XLC,XLY,XLP,XLE,XLF,XLV,XLI,XLB,XLRE,XLK,XLU&types=quote", token: ENV['iex_publish'])
        map = results.map { |k,v| { label: "#{v['quote']['symbol']} -- #{v['quote']['companyName']}", value: v['quote']['latestPrice'], svalue: '%.2f' % ((v['quote']['changePercent']*100).to_f) }}   
        sum = results.values.map{ |q| q['quote']['latestPrice'] }.sum
        treemap = { 
            sum: sum,
            data: map
        }
        # puts treemap

        if treemap
            render json: treemap
        else 
            render json: false
        end 
    end 

    def news
        client = IEX::Api::Client.new()
        results = client.get("/stock/market/batch?symbols=#{params[:symbols]}&types=news&last=2", token: ENV['iex_publish'])
        newsarray = []
        results.each{ |k,v| v['news'].each{ |stocknews| newsarray.push(stocknews) }}
        # puts newsarray
        # puts results

        if results 
            render json: newsarray
        else 
            render json: false
        end 
    end 


end
