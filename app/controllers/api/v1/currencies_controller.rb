class Api::V1::CurrenciesController < Api::V1::ApplicationController

  before_action :set_currency, only: %i[ show destroy]

  # GET /currencies
  def index
    @currencies = Api::V1::Currency.all
    render json: @currencies
  end

  # GET /currencies/1
  def show
    render json: @currency
  end

  # POST /currencies
  def create
    @currency = Api::V1::Currency.new(currency_params)

    if @currency.save
      render json: @currency, status: :created
    else
      render json: @currency.errors, status: :unprocessable_entity
    end
  end


  # DELETE /currencies/1
  def destroy
    @currency.destroy!
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_currency
    @currency = Api::V1::Currency.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def currency_params
    params.require(:currency).permit(:name, :api_reference)
  end
end
