class CreateLinkInstitutions < ActiveRecord::Migration[7.0]
  def change
    create_table :link_institutions do |t|
      t.string :country
      t.string :name

      t.timestamps
    end
  end
end
