class Project < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :contacts, dependent: :destroy
  has_many :campaigns, dependent: :destroy

  # Validations
  validates :name, presence: true

  # Friendly Id #
  # ------------------------------------------------ #
  extend FriendlyId
  friendly_id :random_slug, use: [:slugged, :finders]

  def random_slug
    self.slug = SecureRandom.hex(5)
  end

end
