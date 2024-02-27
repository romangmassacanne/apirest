class Api::V1::HomeController < Api::V1::ApplicationController

    before_action :authenticate_user, only: [:auth]


    def index
        response = RestClient.get 'https://api.coindesk.com/v1/bpi/currentprice/USD.json'
        data = JSON.parse(response.body)
        bitcoin_price = data['bpi']['USD']['rate']
      
        render json: { bitcoin_price: bitcoin_price }
    end


    def auth
        render json: {status: 200, msg: "Actualmente has iniciado sesion como #{current_user.username}"}
    end

end