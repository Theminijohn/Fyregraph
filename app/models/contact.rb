class Contact < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :project
  has_many :messages, dependent: :destroy, as: :messagable

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :mobile_phone, presence: true, uniqueness: { scope: :project } 

  def name
    "#{first_name} #{last_name}"
  end

end
