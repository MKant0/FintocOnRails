class CreateMovementSenderAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :movement_sender_accounts do |t|
      t.string :holder_id
      t.string :holder_name
      t.string :number
      t.integer :id_movement_sender_institution

      t.timestamps
    end
  end
end
