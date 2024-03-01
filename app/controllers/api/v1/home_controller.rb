class Api::V1::HomeController < Api::V1::ApplicationController

    
    def index
        begin
            response = RestClient.get 'https://api.coindesk.com/v1/bpi/currentprice/USD.json'
            data = JSON.parse(response.body)
            bitcoin_price = data['bpi']['USD']['rate']
            render json: { bitcoin_price: bitcoin_price}
        rescue => e
            render json: { error: "Ocurrió un error al procesar la solicitud: #{e.message}" }, status: :internal_server_error
        end
    end

end