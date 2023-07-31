class CreatePaymentIntents < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_intents do |t|
      t.string :object
      t.integer :amount
      t.string :currency
      t.string :widget_token
      t.string :status
      t.string :reference_id
      t.string :transaction_date
      t.string :error_reason
      t.string :mode
      t.integer :id_payment_recipient_account
      t.integer :id_payment_sender_account
      t.integer :id_user

      t.timestamps
    end
  end
end
