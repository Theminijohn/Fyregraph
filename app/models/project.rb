class Project < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :contacts, dependent: :destroy

  # Validations
  validates :name, presence: true

end
