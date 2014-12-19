class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      # Associations
      t.references :user
      t.references :contact

      # Polymorphic Association
      t.belongs_to :messagable, polymorphic: true

      # Attributes
      t.text :body

      t.timestamps
    end
    add_index :messages, [:messagable_id, :messagable_type]
  end
end
