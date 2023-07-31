class CreatePaymentRecipientAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_recipient_accounts do |t|
      t.string :holder_id
      t.string :number
      t.string :type
      t.string :institution_id

      t.timestamps
    end
  end
end
