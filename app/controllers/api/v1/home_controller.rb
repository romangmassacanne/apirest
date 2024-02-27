class Api::V1::HomeController < Api::V1::ApplicationController

    
    def index
        response = RestClient.get 'https://api.coindesk.com/v1/bpi/currentprice/USD.json'
        data = JSON.parse(response.body)
        bitcoin_price = data['bpi']['USD']['rate']
      
        render json: { bitcoin_price: bitcoin_price}
    end

end