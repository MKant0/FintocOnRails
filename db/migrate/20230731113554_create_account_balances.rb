class CreateAccountBalances < ActiveRecord::Migration[7.0]
  def change
    create_table :account_balances do |t|
      t.integer :available
      t.integer :current
      t.integer :limit

      t.timestamps
    end
  end
end
