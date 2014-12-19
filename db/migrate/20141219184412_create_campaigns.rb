class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      
      # Attributes
      t.string :name
      t.text :body

      # Associations
      t.references :user
      t.references :project

      # FriendlyId
      t.string :slug

      t.timestamps
    end
    add_index :campaigns, :name
    add_index :campaigns, :user_id
    add_index :campaigns, :project_id
  end
end
