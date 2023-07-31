class CreateMovementRecipientInstitutions < ActiveRecord::Migration[7.0]
  def change
    create_table :movement_recipient_institutions do |t|
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
