class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.string :object
      t.string :username
      t.string :holder_id
      t.string :link_token
      t.string :holder_type
      t.string :mode
      t.boolean :active
      t.string :status
      t.integer :id_link_institution
      t.integer :id_user

      t.timestamps
    end
  end
end
