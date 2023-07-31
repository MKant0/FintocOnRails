class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :country, :string
    add_column :users, :phone, :string
    add_column :users, :name, :string
  end
end
