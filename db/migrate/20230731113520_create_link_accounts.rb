class CreateLinkAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :link_accounts do |t|
      t.string :object
      t.string :name
      t.string :official_name
      t.string :number
      t.string :holder_id
      t.string :holder_name
      t.string :type
      t.string :currency
      t.string :refreshed_at
      t.integer :id_link

      t.timestamps
    end
  end
end
