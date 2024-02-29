class Api::V1::Currency < ApplicationRecord

    has_many :currency_accounts
    has_many :transactions

    validates :name, presence: true

    attr_accessor :value


    def self.calculate_value(currency_from, currency_to, amount_from)
        (amount_from.to_f * currency_from.value.to_f) / currency_to.value
    end

    # Para esto se supone que cada tipo de moneda que se agregue tenga un json de estructura igual
    # como usd es mi moneda base se devuelve 1 en caso de que no tenga apireference
    def value
        return 1 if api_reference.nil?
        response = RestClient.get api_reference
        data = JSON.parse(response.body)
        data['bpi']['USD']['rate_float']
    end



end 