class Api::V1::UsersController < Api::V1::ApplicationController
  before_action :set_user, only: %i[ show update destroy]
  skip_before_action :authenticate_request, only: [:create]

  # GET /users
  def index
    @users = Api::V1::User.all
    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  # Se crea por default con una cuenta en dolares, a modo de ejemplo se le coloca 1000 usd para empezar
  def create
    @user = Api::V1::User.new(user_params)
    if @user.save
      currency = Api::V1::Currency.find_by(name: "USD")
      currency_account = Api::V1::CurrencyAccount.new(user_id: @user.id, currency_id: currency.id, balance: 1000)
      if currency_account.save
        render json: @user, status: :created, location: @user
      else
        @user.destroy!
        render json: currency_account.errors, status: :unprocessable_entity
      end 
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = Api::V1::User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
