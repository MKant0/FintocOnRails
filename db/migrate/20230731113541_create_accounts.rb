class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :object
      t.string :name
      t.string :official_name
      t.string :number
      t.string :holder_id
      t.string :holder_name
      t.string :type
      t.string :currency
      t.string :refreshed_at
      t.integer :id_account_balance
      t.integer :id_user

      t.timestamps
    end
  end
end
