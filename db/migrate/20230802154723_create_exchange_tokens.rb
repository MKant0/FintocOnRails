class CreateExchangeTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :exchange_tokens do |t|
      t.string :token
      t.references :link_intent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
