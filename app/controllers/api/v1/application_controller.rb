class Api::V1::ApplicationController < ActionController::API
    include Knock::Authenticable
end
