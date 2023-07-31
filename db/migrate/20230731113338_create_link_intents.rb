class CreateLinkIntents < ActiveRecord::Migration[7.0]
  def change
    create_table :link_intents do |t|
      t.string :widget_token
      t.string :exchange_token
      t.string :object
      t.string :country
      t.string :holder_type
      t.string :product
      t.string :mode
      t.string :exchange_token_expires_at
      t.string :status
      t.integer :id_user

      t.timestamps
    end
  end
end
