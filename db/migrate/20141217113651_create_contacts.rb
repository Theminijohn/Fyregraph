class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      # Associations
      t.references :user
      t.references :project

      ## Info
      t.string :first_name
      t.string :last_name

      ## Numbers
      t.string :mobile_phone
      t.string :home_phone

      t.timestamps
    end
    add_index :contacts, :first_name
    add_index :contacts, :last_name
    add_index :contacts, :mobile_phone
    add_index :contacts, :home_phone
  end
end
