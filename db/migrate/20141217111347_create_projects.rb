class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.string :name

      # Friendly Id
      t.string :slug

      t.references :user

      t.timestamps
    end
    add_index :projects, [:user_id, :created_at]
    add_index :projects, :name
    add_index :projects, :slug
  end
end
