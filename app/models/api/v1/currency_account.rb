class Api::V1::CurrencyAccount < ApplicationRecord
    belongs_to :user
    belongs_to :currency

    validates :balance, presence: true


    def has_enough_money?(amount)
        balance >= amount
    end

    def sub_balance(amount)
        self.balance -=  amount
        save
    end

    def add_balance(amount)
        self.balance += amount
        save
    end

    def save_balances(amount_from, amount_to, currency_to)
        sub_balance(amount_from)
        user_account_to_deposit = Api::V1::CurrencyAccount.find_by(user_id: user.id, currency_id: currency_to.id)
        if user_account_to_deposit.nil?
            new_user_currency_account = Api::V1::CurrencyAccount.new(user_id: user.id, currency_id: currency_to.id, balance: amount_to)
            new_user_currency_account.save
        else
            user_account_to_deposit.add_balance(amount_to)
        end 
    end 

    
end 