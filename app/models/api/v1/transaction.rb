class Api::V1::Transaction < ApplicationRecord
    belongs_to :user
    belongs_to :currency_from, class_name: "Api::V1::Currency", foreign_key: "currency_from_id"
    belongs_to :currency_to, class_name: "Api::V1::Currency", foreign_key: "currency_to_id"
  
    validates :amount_from, :amount_to, presence: true

end 