class Message < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :project
  belongs_to :contact

  # Validations
  validates :body, presence: true
  validates :user_id, presence: true
  validates :project_id, presence: true
  validates :contact_id, presence: true

end
