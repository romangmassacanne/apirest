class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.float :balance, null: false, default: 0.0
    end
  end
end