class Project < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :contacts, dependent: :destroy

end
