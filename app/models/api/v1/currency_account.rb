class Api::V1::CurrencyAccount < ApplicationRecord
    belongs_to :user
    belongs_to :currency

    validates :balance, presence: true


    def has_enough_money?(amount)
        balance >= amount
    end

    def sub_balance(amount)
        balance -=  amount
    end

    def add_balance(amount)
        
    end
    
end 