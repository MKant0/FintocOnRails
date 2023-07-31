class CreateMovementSenderInstitutions < ActiveRecord::Migration[7.0]
  def change
    create_table :movement_sender_institutions do |t|
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
