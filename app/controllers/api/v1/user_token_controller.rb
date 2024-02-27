class Api::V1::UserTokenController < Knock::AuthTokenController


  
    #def create
    #    user = User.find_by(email: params[:auth][:email])
    #    if user && user.authenticate(params[:auth][:password])
    #      render json: { jwt: auth_token.token }
    #    else
    #      render json: { error: 'Invalid email or password' }, status: :unauthorized
    #    end
    #  end
end
