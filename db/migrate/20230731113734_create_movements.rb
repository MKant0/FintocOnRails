class CreateMovements < ActiveRecord::Migration[7.0]
  def change
    create_table :movements do |t|
      t.string :object
      t.integer :amount
      t.string :post_date
      t.string :description
      t.string :transaction_date
      t.string :currency
      t.string :reference_id
      t.string :type
      t.boolean :pending
      t.string :comment
      t.integer :id_movement_recipient_account
      t.integer :id_movement_sender_account
      t.integer :id_user

      t.timestamps
    end
  end
end
