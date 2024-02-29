class CreateCurrencyAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :currency_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.float :balance, default: 0.0
    end
  end
end
