class Campaign < ActiveRecord::Base

  # Associations
  belongs_to :user
  belongs_to :project

end
