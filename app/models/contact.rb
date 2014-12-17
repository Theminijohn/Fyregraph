class Contact < ActiveRecord::Base

  # Association
  belongs_to :user
  belongs_to :project

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile_phone, presence: true, uniqueness: { scope: :project } 

end
