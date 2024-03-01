class Api::V1::User < ApplicationRecord
    require "securerandom"
    has_secure_password

    has_many :transactions
    has_many :currency_accounts

    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
    validates :username, presence: true, uniqueness: true


    def balance_for(currency_id)
        currency_account = currency_accounts.find_by(currency_id: currency_id)
        if currency_account
            currency_account.balance
        else
            0.0
        end
    end

end
