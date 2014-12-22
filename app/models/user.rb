class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  has_many :projects, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :campaigns, dependent: :destroy
  has_many :messages, dependent: :destroy

  # Validations
  validates_presence_of :first_name, :last_name, :mobile_phone

  
end
