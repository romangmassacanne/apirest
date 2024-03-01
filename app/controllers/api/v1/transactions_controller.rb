class Api::V1::TransactionsController < Api::V1::ApplicationController
  
    before_action :set_transaction, only: %i[ show ]

    # este index es para un user en especifo, el logueado
    def index
        render json: @current_user.transactions
    end 


    # GET /transactions/1
    def show
        render json: @transaction
    end

    # POST /transactions
    # Para esta transacción como se puede ver no hay seguridad en caso de que falle por alguna razon y el user pueda perder el dinero
    # no se modelo porque por el alcance de la app no se consideró esencial 
    def create
        permitted_params = transaction_params
        currency_from = Api::V1::Currency.find_by(name: permitted_params[:currency_from])
        currency_to = Api::V1::Currency.find_by(name: permitted_params[:currency_to])
        amount_from = permitted_params[:amount_from]

        user_currency_account = @current_user.currency_accounts.find_by(currency_id: currency_from.id) if currency_from
        if user_currency_account && user_currency_account.has_enough_money?(amount_from)
            amount_to = Api::V1::Currency.calculate_value(currency_from, currency_to, permitted_params[:amount_from])
            @transaction = Api::V1::Transaction.new(currency_from: currency_from, currency_to: currency_to, amount_from: amount_from, amount_to: amount_to, user_id: @current_user.id)
            if user_currency_account.save_balances(amount_from, amount_to, currency_to) && @transaction.save
                render json: @transaction, status: :created
            else
                erros = @transaction.errors.full_messages + user_currency_account.errors.full_messages
                render json: erros, status: :unprocessable_entity
            end
        else
            render json: { error: "El usuario no posee suficiente saldo para realizar la transacción" }
        end
    end



    private

    def transaction_params
        params.require(:transaction).permit(:currency_from, :currency_to, :amount_from)
    end

    def set_transaction
        @transaction = Api::V1::Transaction.find(params[:id])
      end
end
