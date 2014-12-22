class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      # Attributes
      t.text :body
      t.boolean :bug

      # Associations
      t.references :user
      t.references :project
      t.references :contact

      t.timestamps
    end
    add_index :messages, :bug
    add_index :messages, :user_id
    add_index :messages, :project_id
    add_index :messages, :contact_id
    add_index :messages, [:project_id, :contact_id]

  end
end
