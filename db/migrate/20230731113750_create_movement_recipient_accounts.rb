class CreateMovementRecipientAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :movement_recipient_accounts do |t|
      t.string :holder_id
      t.string :holder_name
      t.string :number
      t.integer :id_movement_recipient_institution

      t.timestamps
    end
  end
end
