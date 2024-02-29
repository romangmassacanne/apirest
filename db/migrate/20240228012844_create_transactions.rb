class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :currency_from, null: false, foreign_key: { to_table: :currencies }
      t.references :currency_to, null: false, foreign_key: { to_table: :currencies }
      t.float :amount_from, null: false
      t.float :amount_to, null: false
    end
  end
end
