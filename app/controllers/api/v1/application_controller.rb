class Api::V1::ApplicationController < ActionController::API

    include JsonWebToken
    before_action :authenticate_request

    private

    def authenticate_request
        begin
            header = request.headers['Authorization']
            header = header.split(' ').last if header
            decoded = jwt_decode(header)
            @current_user = Api::V1::User.find(decoded[:user_id])
        rescue JWT::DecodeError => e
            render json: { error: "El usuario no tiene permiso" }, status: :unauthorized
        end
    end

end
