require 'rails_helper'

describe Project do
  
  it 'is valid with a name and user_id' do
    project = Project.new(
      name: 'Testing',
      user_id: 1
      )
    expect(project).to be_valid
  end

  it 'is invalid without a name'

end
